Rails.application.routes.draw do
  devise_for :users, controllers:{
  	# diereccionamientos de los provides tenemos un controlador dentro de users llamado omniauth_callbacks
  	omniauth_callbacks: "users/omniauth_callbacks"
  }
  # get 'main/home'
  # se crea la ruta para  main/home, por default cuando solo se pone el dominio rails busca la vista con el nombre del controlador 
  # buscando la vista de la carpeta del controlador, asociado a la accion, asi este no tenga el render
  root 'main#home'

  # verbo       URL                 vista modelo/controlador#accion
  post          "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up" 

  #necesito configurar las rutas para que facebook sepa a donde llegara su respuesta callback_url
  #Procesar info FB
  # Autenticar o crear user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
