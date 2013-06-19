require "rubygems"

#clase para manejar los datos de los resultados de Twitter
class Tweet
	attr_accessor :usr
	attr_accessor :imagen
	attr_accessor :txt
	attr_accessor :datetime
	def initialize(pDate,pUsr,pTxt,pImg)	
		@usr = pUsr				
		@datetime = pDate
		@txt = pTxt
		@imagen = pImg
	end
	def insertar(pDate,pUsr,pTxt,pImg)	
		@usr = pUsr
		@imagen = pImg
		@txt = pTxt
		@datetime = pDate
	end
end
