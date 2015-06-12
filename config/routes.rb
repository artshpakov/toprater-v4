Rails.application.routes.draw do

  get 'alternatives/index'

  scope '(:locale)', locale: /en|ru/ do
    root to: 'index#index'
    scope ':sphere' do
      root to: 'alternatives#index', as: :sphere

      scope '/objects' do
        get '(/criteria/:criteria)' => 'alternatives#index', as: :list
      end
    end
  end

end
