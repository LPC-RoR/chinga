module ProcesaElemento
  extend ActiveSupport::Concern

    def procesa_elemento(objeto)
      lineas = objeto.letra.split("\n")
      n_estrofa = 1
      estrofa = objeto.estrofas.find_by(n_estrofa: n_estrofa)
      if estrofa.blank?
        estrofa = objeto.estrofas.create(elemento_id: objeto.id, n_estrofa: n_estrofa)
      end
      n_linea = 1
      lineas.each do |linea_sucia|
        linea = linea_sucia.gsub(/\r/, '')

        if linea.blank?
          unless n_linea == 1
            n_estrofa += 1
            estrofa = objeto.estrofas.find_by(n_estrofa: n_estrofa)
            if estrofa.blank?
              estrofa = objeto.estrofas.create(n_estrofa: n_estrofa)
            end
          end
        else
          linea_estrofa = estrofa.lineas.find_by(n_linea: n_linea)
          if linea_estrofa.blank?
            linea_estrofa = estrofa.lineas.create(elemento_id: objeto.id, linea: linea, n_linea: n_linea)
          else
            linea_estrofa.linea = linea
            linea_estrofa.save
          end

          ult = linea_estrofa.linea.split(' ').last.delete_suffix(".").delete_suffix(',').downcase
          ultima = Ultima.find_by(ultima: ult)

          if linea_estrofa.ultima.blank?
            if ultima.blank?
              ultima = Ultima.create(ultima: ult)
            end
          end
          linea_estrofa.ultima_id = ultima.id
          linea_estrofa.save

          n_linea += 1
        end
      end
    end

    def desprocesa_elemento(objeto)
      objeto.estrofas.each do |estrofa|
        estrofa.lineas.each do |linea|
          linea.delete
        end
        estrofa.delete
      end

      claves_vacias_ids = IndClave.all.map {|c| c.id if c.ind_indices.empty?}.compact
      claves_vacias = IndClave.where(id: claves_vacias_ids)
      claves_vacias.delete_all

      facetas_vacias_ids = IndFaceta.all.map {|f| f.id if f.ind_indices.empty?}.compact
      facetas_vacias = IndFaceta.where(id: facetas_vacias_ids)
      facetas_vacias.delete_all
    end

end