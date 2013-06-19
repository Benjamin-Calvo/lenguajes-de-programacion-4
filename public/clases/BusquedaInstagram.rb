require "rubygems"
require "instagram"

#Clase que ejecuta los procesos necesarios para hacer la consulta a Instagram
class BusquedaInstagram
	attr_reader :result
	def initialize(palabra,cant=2)
		#configura el usuario
		Instagram.configure do |config|
			config.client_id = "419714448"
			config.access_token = "419714448.5b9e1e6.54ac3bc1f3804c7288a3ef9bca4ebc62"
		end
		i=500
		@result = Instagram.tag_recent_media(palabra, options={:count=>cant}) 	
	end
	
	public 
	def getResultado
		return @result
	end
end
