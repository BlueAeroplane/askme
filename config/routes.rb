Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations',  sessions: 'users/sessions' }

  scope 'account' do
    get 'wall', to: 'account#wall', as: 'account_wall'

    # Questions from logged-in user perspective

    get 'questions/:id/answer', to: 'account#answer', as: 'account_answer'
    patch 'questions/:id/answer', to: 'account#do_answer', as: 'do_account_answer'
    get 'questions/:id', to: 'account#question', as: 'account_question'
    delete 'questions/:id', to: 'account#delete_question', as: 'account_delete_question'
    delete 'questions/:id/answer', to: 'account#delete_answer', as: 'account_delete_answer'
    get 'questions', to: 'account#questions', as: 'account_questions'
    delete 'questions', to: 'account#delete_questions', as: 'account_delete_questions'


    get 'follows', to: 'account#follows', as: 'account_follow'
    get 'search', to: 'account#search', as: 'account_search'
    get 'settings', to: 'account#settings', as: 'account_settings'

  end

  # Users profile
  get ':username/answer/:id', to: 'profile#answer', as: 'profile_answer'
  get ':username/gifts', to: 'profile#gifts', as: 'profile_gifts'
  get ':username/best', to: 'profile#best', as: 'profile_best'
  post ':username/follow', to: 'profile#follow', as: 'profile_follow'
  post ':username/ask', to: 'profile#ask', as: 'profile_ask'
  get ':username', to: 'profile#answers', as: 'profile_answers'

  root 'home#home'
end
