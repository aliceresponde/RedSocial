class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

     # Metodo de clase, que 
     # Buscar si hay user con mis credenciales proveedor ui_id
	def self.from_omniauth(auth)
		# busco el usuario  con ese uid, asociado al provider
		# si encuenta el usuario, retorna le primero q encuentre, si no
		# simplemente lo crea con esos parametros
		where(provider: auth[:provider] , uid: auth[:uid]).first_or_create do |user|
			# ese user se ha creado
			# veifio los datos q tengo de la info del user, como email, pass 
			if auth[:info] #si tra el  hash del info, lleno los datos
				# user.email = auth[:info][:email]
				# note for user that has not email, 
				user.name  = auth[:info][:name]
			end
			# creo una cadena, con caracteres aleatoreos (20) para emular el pass
			# Nota   hay formas de  hacer  q email y pass no sea requerido pero como
			# se puede via email, es mejor dejarlos
			user.password = Devise.friendly_token[0,20]

		end				
			
	end	

	#Meotod de instancia  primero creo el objeto, y luego llamo el metodo 
end
