

#Clase que ejecuta los procesos necesarios para hacer la consulta a Twitter
class BusquedaTwitter
	attr_reader :resultado
	def initialize(palabra,contador=2)
		#configura el usuario
		Twitter.configure do |config|
			config.consumer_key = "yGTcqkmpIDyGRU1xngysYw"
			config.consumer_secret = "1bQPA6wuwTcHSv6nD1mRqfhxJlmv9geEfk9dfN5k"
			config.oauth_token = "1520281886-zCl80qdRLxyGXs15VO56qRJfa4sAQyrPWywH0fP"
			config.oauth_token_secret = "aVcUWSLQ9aWzbu6wj1osL0yvveWkery27CWmmwYRR8"
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
