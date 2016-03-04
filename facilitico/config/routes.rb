Rails.application.routes.draw do
  devise_for :users
  # get 'main/home'
  # se crea la ruta para  main/home, por default cuando solo se pone el dominio rails busca la vista con el nombre del controlador 
  # buscando la vista de la carpeta del controlador, asociado a la accion, asi este no tenga el render
  root 'main#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
