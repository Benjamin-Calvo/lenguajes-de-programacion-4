require "rubygems"
require "instagram"

#Clase que ejecuta los procesos necesarios para hacer la consulta a Instagram
class BusquedaInstagram
	attr_reader :result
	def initialize(palabra,cant=2)
		#configura el usuario
		Instagram.configure do |config|
			config.client_id = #identificador de cliente de Instagram
			config.access_token = #token de acceso de Instagram
		end
		i=500
		@result = Instagram.tag_recent_media(palabra, options={:count=>cant}) 	
	end
	
	public 
	def getResultado
		return @result
	end
end
