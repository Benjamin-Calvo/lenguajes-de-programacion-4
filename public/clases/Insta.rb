require "rubygems"

#clase para manejar los datos de los resultados de Instagram
class Insta
	attr_accessor :usr
	attr_accessor :imagen
	attr_accessor :datetime
	def initialize(pUsr,pImg,pDate)	
		@usr = pUsr				
		@datetime = pDate
		@imagen = pImg
	end
	def insertar(pUsr,pImg,pDate)	
		@usr = pUsr
		@imagen = pImg
		@datetime = pDate
	end
end
