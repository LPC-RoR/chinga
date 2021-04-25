module ProcesaEstructura
	extend ActiveSupport::Concern

	require 'yaml'

	def facetas_busqueda(estructura, objeto, campo)
		campo_base = objeto.send(campo).strip.split(' ').join(' ').downcase
		texto_faceta(estructura, objeto, campo_base)
	end

	def texto_faceta(estructura, objeto, texto)
		clave_texto = texto.to_s.downcase.gsub(',', ' ').gsub('.', ' ').split(' ').join(' ')
		
		ind_faceta = estructura.ind_facetas.find_by(ind_faceta: clave_texto)
		if ind_faceta.blank?
			ind_faceta = estructura.ind_facetas.create(ind_faceta: clave_texto)
		end

		if ind_faceta.ind_indices.where(class_name: objeto.class.name).where(objeto_id: objeto.id).empty?
			ind_indice = ind_faceta.ind_indices.create(ind_estructura_id: estructura.id, class_name: objeto.class.name, objeto_id: objeto.id)
		end
	end

	def procesa_campos_busqueda(estructura, objeto, campo)
		# TEXTO BASE
		# 1.- Se remplazan "\n" por ' '
		# 2.- Se lleva a un vector con split(' ')
		# 3.- Se procesa el vector para sacar caracteres especiales con 'strip'[ reptilia—squamata—iguanidae ]
		# 4.- Se vuelve a juntar con join(' ')
		# 5.- Se remplaza cualquier puntuación con '|'
		# 6.- Se remplaza ord = 160 y ord = 39
		campo_base = objeto.send(campo).strip.split(' ').join(' ').downcase

		unless campo_base.blank?

			texto_base_1 = campo_base.downcase.gsub(/\n/, ' ').split(' ').map {|pal| pal.strip}.join(' ').gsub(/[\.,;–+°¿=*":\/\?\-\(\)]/, '|')
			texto_base = texto_base_1.split('').map {|c| ([160, 39, 8217].include?(c.ord) ? ' ' : c)}.join('').strip

			frases = texto_base.split('|')

			frases.each do |frase|

				palabras = frase.split(' ')

				palabras.each do |pal|

					limpia = limpieza_final(pal)

					unless excluye_palabra(limpia)
						clave = estructura.ind_claves.find_by(ind_clave: limpia)
						if clave.blank?
							clave = estructura.ind_claves.create(ind_clave: limpia)
						end

						palabra = estructura.ind_palabras.find_by(ind_palabra: limpia)
						if palabra.blank?
							palabra = estructura.ind_palabras.create(ind_palabra: limpia, ind_clave_id: clave.id)
						end

						if clave.ind_indices.where(class_name: objeto.class.name).where(objeto_id: objeto.id).empty?
							clave.ind_indices.create(ind_estructura_id: estructura.id, class_name: objeto.class.name, objeto_id: objeto.id)
						end
					end

				end
			end
		end
	end

	def limpieza_final(palabra)
		palabra.strip.delete_suffix('\'').delete_suffix('\"').delete_prefix('\'').delete_prefix('\"').delete_suffix('\'s')
	end

	def excluye_palabra(palabra)
		if palabra.blank?
			true
		else
			letras_no_peritidas = (palabra.length == 1 and not (['i', 'o', 'a'].include?(palabra)))

			entero = Integer(palabra) rescue nil
			enteros_no_permitidos = (palabra.length != 4 and (not entero.blank?))

			letras_no_peritidas or enteros_no_permitidos or exception(palabra)
		end
	end

	def exception(palabra)
		excps_file = YAML.load_file('config/excepciones.yml')
		excps_pronombres     = (excepciones[:pronombres]     ? excps_file['pronombres'].include?(palabra) : false)
		excps_articulos      = (excepciones[:articulos]      ? excps_file['articulos'].include?(palabra) : false)
		excps_preposiciones  = (excepciones[:preposiciones]  ? excps_file['preposiciones'].include?(palabra) : false)
		excps_conjunciones   = (excepciones[:conjunciones]   ? excps_file['conjunciones'].include?(palabra) : false)
		excps_adverbios      = (excepciones[:adverbios]      ? excps_file['adverbios'].include?(palabra) : false)
		excps_verboser       = (excepciones[:verboser]       ? excps_file['verboser'].include?(palabra) : false)
		excps_numbers        = (excepciones[:numbers]        ? excps_file['numbers'].include?(palabra) : false)
		excps_exceptions     = (excepciones[:exceptions]     ? excps_file['exceptions'].include?(palabra) : false)

		excps_pronombres or excps_articulos or excps_preposiciones or excps_conjunciones or excps_adverbios or excps_verboser or excps_numbers or excps_exceptions
	end

	def busqueda_publicaciones(search, modelo)
		palabras = search.split(' ')
		modelo_ids = []
		palabras.each do |palabra|

			ind_palabra = IndPalabra.find_by(ind_palabra: palabra.strip.downcase)
			if excluye_palabra(palabra) or ind_palabra.blank?
				modelo_ids = []
			else
				modelo_ids = ind_palabra.ind_clave.present? ? modelo_ids.union(ind_palabra.ind_clave.ind_indices.where(class_name: modelo).map {|ii| ii.objeto_id}) : []
			end
		end
		publicaciones = modelo.constantize.where(id: modelo_ids)
		publicaciones
	end

	def indexa_registro(objeto)
		modelos_proceso = IndModelo.where(ind_modelo: objeto.class.name)

		modelos_proceso.each do |modelo|

			campos = modelo.campos.split(' ')
			campos.each do |campo|
				procesa_campos_busqueda(modelo.ind_estructura, objeto, campo)
			end

			unless modelo.facetas.blank?
				facetas = modelo.facetas.split(' ')
				facetas.each do |campo|
					facetas_busqueda(modelo.ind_estructura, objeto, campo)
				end
			end

			unless modelo.coma_facetas.blank?
				c_facetas = modelo.coma_facetas.split(' ')
				c_facetas.each do |campo|
					parciales = objeto.send(campo).split(',')
					parciales.each do |parcial|
						texto_faceta(modelo.ind_estructura, objeto, parcial.strip.split(' ').join(' ').downcase)
					end
				end
			end

			unless modelo.rel_facetas.blank?
				rels_name =  modelo.rel_facetas.split(' ')
				rels_name.each do |rel_name|
					rels = objeto.send(rel_name)
					rels.each do |rel_object|
						if faceta_condicion(rel_object)
							texto_faceta(modelo.ind_estructura, objeto, rel_object.send(rel_object.class.name.tableize.singularize).strip.split(' ').join(' ').downcase)
						end
					end
				end
			end
		end
	end

	def desindexa_registro(objeto)
		indices = IndIndice.where(class_name: objeto.class.name).where(objeto_id: objeto.id)
		indices.delete_all
	end

	def faceta_condicion(objeto)
		case objeto.class.name
		when 'Soporte'
			(objeto.tipo_soporte.blank? ? false : ['Disco', 'Libro'].include?(objeto.tipo_soporte.tipo_soporte))
		when 'Linea'
			true
		end
	end

	def excepciones
		{
			pronombres:    true,
			articulos:     true,
			preposiciones: true,
			conjunciones:  true,
			adverbios:    false,
			verboser:      true,
			numbers:       true,
			exceptions:    true
		}
	end
end