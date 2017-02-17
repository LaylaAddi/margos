Rails.application.routes.draw do






  devise_for :company_users, 
  :controllers => { registrations: 'company_users_registrations/registrations'} 
  resources :company_users do
    collection {post :import}
  end
  
  devise_for :shipper_users, 
  :controllers => { registrations: 'shipper_users_registrations/registrations'}
  resources :shipper_users do
    collection {post :import}
  end
  
  devise_for :driver_users, 
  :controllers => { registrations: 'driver_users_registrations/registrations'}
  
  resources :driver_users do
    collection {post :import}
      resources :driver_statements
        resources 'notifications', only: [:create] 
          resources :driver_checkins
            resources :messages 
  end 
  
  resources :users do
    collection {post :import}
  end 
  
  resources :trucks do
    resources :truck_images
      resources :truck_miles
        collection {post :import}
  end
  
  resources :trailers do
    resources :trailer_images
      resources :trailer_miles
        collection {post :import}
  end
 
  resources :company_profiles do
    collection {post :import}
      resources :mcs 
        resources :carrier_mcs 
          resources :broker_mcs 
            resources :us_dots
              resources :company_profile_memberships
  end
  

    
  resources :loads do
    collection {post :import}
      resources :load_documents, only: [:new, :create, :update] 
        resources :transactions
          resources :addresses 
                    resources :load_origin_addresses 
                              resources :load_destination_addresses 
  end 
  
  resources :load_documents
  
  resources :vendor_profiles do
    collection {post :import}
  end   

  resources :miles
  resources :messages
  resources :text_messages
  resources :driver_checkins
  resources :driver_statements, only: [:index] do
    collection {post :import}
  end   
  resources :app_variables
  


  get 'company_dashboard', to: 'company_users#company_dashboard'
  get 'driver_dashboard', to: 'driver_users#driver_dashboard'
  get 'shipper_dashboard', to: 'shipper_users#shipper_dashboard'
  
  root to: 'creatives#index' 

  get 'pages/index', to: 'pages#index'
  
  get 'creatives/carrier_package', to: 'creatives#download_carrier'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount ActionCable.server => '/cable'
end
