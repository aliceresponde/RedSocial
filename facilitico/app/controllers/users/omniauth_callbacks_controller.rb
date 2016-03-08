class Users::OmniauthCallbacksController < ApplicationController
	# creamos la accion llamada facebook,try to loging  and  show parameters
	def facebook
		# try to loging  and  show parameter as an Error
		# raise params.to_yaml

		# show parameters  from FaceBook that  we need
		# iu_id
		# provider
		# email - puede que no se tenga en todos los casos
		#  las operaciones a DB deben ir en el modelo no en el controlador
		# raise request.env["omniauth.auth"].to_yaml

		@user = User.from_omniauth(request.env["omniauth.auth"])
		# verifico si el usuario esta almacenado en DB
		if @user.persisted?
			# guarda la sesion 
			@user.remember_me = true 
			# autenticar al user  y redireccionarlo al home
			sign_in_and_redirect @user , event: :authentication			
		end
	end
end