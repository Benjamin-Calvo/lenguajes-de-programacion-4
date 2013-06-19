require "rubygems"
require "sinatra"
require "slim"
require "twitter"
require "instagram"
require "time"
load 'public/clases/BusquedaTwitter.rb' 
load 'public/clases/BusquedaInstagram.rb' 
load 'public/clases/Tweet.rb' 
load 'public/clases/Insta.rb' 

#Clase principal que realiza la busqueda y contiene el diseño de la pagina
@listaTweet
@listaInsta
get '/' do
	slim :index
end


get "/busqueda" do
	#
	txt=params[:textoBusqueda]
	num=params[:contador]
	if(num != "")
		#ejecuta la busqueda en Twitter
		@sdf=BusquedaTwitter.new(txt,num)
		@res=@sdf.getDatos
		i = 0
		largo = @res.count
		@TweetsList=Array.new(Integer(num))
		while i<largo  do		
			listaTweet = @res[i].split("|**|")		
			@TweetsList[i] = Tweet.new(listaTweet[0],listaTweet[1],listaTweet[2],listaTweet[3])
			
			i+=1
		end
		#ejecuta la busqueda en Instagram
		@resulInstagram=BusquedaInstagram.new(txt,num)
		@resInstagram=@resulInstagram.getResultado
		j = 0
		largo2 = @resInstagram.count
		@instagramList=Array.new(Integer(num))
		while j<largo2  do		
			listaInsta = @resInstagram[j]	
			@hora = ((listaInsta).created_time).nil? ? "" : Time.at(Integer((listaInsta).created_time)).to_datetime.to_s
			@instagramList[j] = Insta.new((listaInsta).user.full_name, (listaInsta).images.standard_resolution.url, @hora)
			j+=1
		end			
		@listaTweet = nil
		slim :busqueda	
	else 
		slim :index	
	end
end
#Diseño de la pagina 
__END__
@@layout
doctype html
html
  head
    meta charset="utf-8"
    /! Título de ventana
    title Busqueda de contenido en Twitter e Instagram
    link rel="stylesheet" media="screen, projection" href="/styles.css"
    /[if lt IE 9]
      script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"
  body
	/! Título de página
    h1 Realizar búsqueda en Twitter e Instagram
    hr
    == yield
@@index
div.PrimerCapa
	h3 Digite la palabra que desee buscar, y la cantidad de resultados que desea a continuación:
	ul.tasks
	form action="/busqueda"
		input type="text" size="12" name="textoBusqueda"
		input type="text" size="2" name="contador"
		input type="submit" value="BUSCAR"
	
	div.Separador		
		div.acercaDe
					hr 
					h3 Acerca de la aplicación...
					h4 Instituto Tecnológico de Costa Rica
					p Tarea Programada 4 -  Lenguajes de programación
					p Estudiantes 
					li Benjamín Calvo de León
					li Alexander Durán Martínez
					p 19 de junio 2013
@@busqueda
img src='images/twitt.jpeg'  width="100px" height="100px" 
h1 Resultados de Twitter
hr
-@TweetsList.each do |tweet|
	div		
		h3 = (tweet).usr
		img src=(tweet).imagen width="50px" height="50px" 
		p = (tweet).txt
		h5 = (tweet).datetime
hr
img src='images/inst.jpeg'  width="100px" height="100px" 
h1 Resultados de Instagram
hr
-@instagramList.each do |post|
	div
		h2=(post).usr				
		img src=(post).imagen width="100px" height="100px" 
		h5=(post).datetime
hr
