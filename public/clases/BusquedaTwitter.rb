
#Clase que ejecuta los procesos necesarios para hacer la consulta a Twitter
class BusquedaTwitter
	attr_reader :resultado
	def initialize(palabra,contador=2)
		#configura el usuario
		Twitter.configure do |config|
			config.consumer_key = #llave de consumidor de Twitter
			config.consumer_secret = #contraseña de consumidor de Twitter
			config.oauth_token = #token de autenticación de Twitter
			config.oauth_token_secret = #contraseña de autenticación de Twitter
		end
		if contador == "" then
			contador = 2 
		end
		# Consulta a Twitter 
		@resultado = Twitter.search(palabra, :count => contador, :result_type => "recent", :lang => "es").results.map do |status|
			"#{status.created_at}|**|#{status.from_user}|**|#{status.full_text}|**|#{status.user.profile_image_url(size=:bigger)}"
		end
	end
	
	public
	def getDatos
		return @resultado
	end
end
