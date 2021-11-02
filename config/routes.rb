Erp::Electrical::Engine.routes.draw do
    scope '(:locale)', locale: /en|vi/ do
        namespace :backend, module: 'backend', path: 'backend' do
            resources :services do
                collection do
                  post 'list'
                  put 'move_up'
                  put 'move_down'
                end
            end
            resources :service_categories do
                collection do
                  post 'list'
                  get 'dataselect'
                  put 'move_up'
                  put 'move_down'
                end
            end
            resources :diaries do
                collection do
                  post 'list'
                  put 'move_up'
                  put 'move_down'
                end
            end
            resources :faqs do
                collection do
                  post 'list'
                  put 'move_up'
                  put 'move_down'
                end
            end
            resources :blogs do
                collection do
                  post 'list'
                  put 'move_up'
                  put 'move_down'
                end
            end
        end
    end
end