class EstadoPersona < ApplicationRecord
  #Relaciones
  #has_many :persona
  belongs_to :estado, :class_name => 'Estado', :foreign_key => 'estado_id' , optional: :true
  belongs_to :vendedor, optional: :true
  
  #Validaciones del modelo
  validates :estado, :presence => { :message => "Debe seleccionar el Estado" }
  validates :vendedor, :presence => { :message => "Debe seleccionar el Vendedor" }
  validates :fecha_inicio, :presence => { :message => "Debe completar el campo Fecha de inicio" }
  validates :fecha_fin, :presence => { :message => "Debe completar el campo Fecha de finalización" }
  validate  :fechaLic

  def fechaLic
  	hayCarga = CargaDiarium.where('fecha >= ?', self.fecha_inicio).where('fecha <= ?', self.fecha_fin).where(vendedor_id: self.vendedor_id).count 
    vendedorLic = EstadoPersona.where(:vendedor_id => self.vendedor_id).last
    vendedorSelf = EstadoPersona.where(:vendedor_id => self.vendedor_id).where(id: self.id).first
    vendedorLic1 = EstadoPersona.where(:vendedor_id => self.vendedor_id).where.not(id: self.id).first
    if (vendedorSelf == nil)
    	if (vendedorLic1 != nil)
		    if (vendedorLic != nil)	    
		      if (vendedorLic.fecha_inicio.to_i >= self.fecha_inicio.to_i)
		    	errors.add(:base, "La fecha de incio es menor o igual a la fecha de incio de la última asistencia tomada")
		      end
		    
		      if (vendedorLic.fecha_fin.to_i >= self.fecha_inicio.to_i)
		    	errors.add(:base, "La fecha de incio es menor o igual a la fecha de finalizacion de la última asistencia tomada")
		      end


		      if (vendedorLic.fecha_inicio.to_i >= self.fecha_fin.to_i)
		    	errors.add(:base, "La fecha de finalizacion es menor o igual a la fecha de inicio de la última asistencia tomada")
		      end

		      if (vendedorLic.fecha_fin.to_i >= self.fecha_fin.to_i)
		    	errors.add(:base, "La fecha de finalizacion es menor o igual a la fecha de inicio de la última asistencia tomada")
		      end

		      if (vendedorLic.fecha_inicio.to_i == self.fecha_inicio.to_i) and (vendedorLic.fecha_fin.to_i == self.fecha_fin.to_i)
		      	errors.add(:base, "Este vendedor ya tiene cargada una inasistencia en ese rango de fecha")
		      end
		    end
		  	if (self.fecha_inicio.to_i > self.fecha_fin.to_i)
		    	errors.add(:base, "la fecha de inicio no puede ser mayor a la de fin")
		  	end
		end
  	end
  	if (hayCarga != 0)
	  	errors.add(:base,  "No se puede crear el registro de inasistencia retroactivo porque el vendedor ha cargado datos en ese período")
    end
  end

end
