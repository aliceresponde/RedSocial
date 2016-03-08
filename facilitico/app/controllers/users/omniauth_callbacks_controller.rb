class Users::OmniauthCallbacksController < ApplicationController
	# creamos la accion llamada facebook,try to loging  and  show parameters
	def facebook
		# try to loging  and  show parameter as an Error
		# raise params.to_yaml

		# show parameters  from FaceBook that  we need
		raise request.env["omniauth.auth"].to_yaml
	end
end