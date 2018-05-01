module CargaDiariaHelper

	#Genera la estructura de datos necesaria para graficar un chart
	def chart_data data
		data_personal = {
        	datasets: [{
          		data: data.map(&:cantidad),
          		backgroundColor: ['blue', 'purple', 'orange']
        	}],
        	labels: data.map(&:descripcion)
    	}
	end

	#Genera la estructura de datos para cargar opciones a un chart
	def chart_options title
		options_personal = {
      		title: {
        		display: true,
        		text: title
      		},
      		responsive: true
    	}
	end
end
