class EstadoPersona < ApplicationRecord
  #has_many :persona
  belongs_to :estado, :class_name => 'Estado', :foreign_key => 'estado_id' , optional: :true
  belongs_to :vendedor, optional: :true

  validates :fecha_inicio, :presence => { :message => "Debe completar el campo Fecha" }
  validates :estado, :presence => { :message => "Debe seleccionar el Estado" }
  validates :vendedor, :presence => { :message => "Debe seleccionar el Vendedor" }

  validate  :fechaLic

  def fechaLic
    agenteLic = EstadoPersona.where(:vendedor_id => self.vendedor_id).first
    agenteLic1 = EstadoPersona.where(:vendedor_id => self.vendedor_id).where.not(id: self.id).first
    debugger
    if (agenteLic1 != nil)
	    if (agenteLic != nil)
	      if (agenteLic.fecha_fin == nil)
	    	 errors.add(:base, "Existe agente ya tiene una inasistencia sin fecha de finalización, debe finalizarla para poder generar otra inasistencia")
	      end
	    
	      if (agenteLic.fecha_inicio >= self.fecha_inicio)
	    	errors.add(:base, "La fecha de incio es menor o igual a la fecha de incio de la última asistencia tomada")
	      end
	    
	      if (agenteLic.fecha_fin >= self.fecha_inicio)
	    	errors.add(:base, "La fecha de incio es menor o igual a la  fecha de finalizacion de la última asistencia tomada")
	      end


	      if (agenteLic.fecha_inicio >= self.fecha_fin)
	    	errors.add(:base, "La fecha de finalizacion es menor o igual a la  fecha de inicio de la última asistencia tomada")
	      end

	      if (agenteLic.fecha_inicio == self.fecha_inicio) and (agenteLic.fecha_fin == self.fecha_fin)
	    	 errors.add(:base, "Este vendedor ya tiene cargada una inasistencia en ese rango de fecha")
	      end
	    end
	  if (self.fecha_inicio > self.fecha_fin)
	    	 errors.add(:base, "la fecha de inicio no puede ser mayor a la de fin")
	  end
  	end
  end
end
