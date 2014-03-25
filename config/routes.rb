ExamReport::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'sessions'}
  
  resources :students do
    collection do
      get "student_upload"
      post "upload"
    end
  end

  resources :faculties do
    collection do
      get "faculty_upload"
      post "upload"
    end
  end
  
  
  get 'auto_search/autocomplete_student_roll_number'
  get 'auto_search/autocomplete_faculty_name'
  get 'auto_search/autocomplete_student_by_roll_no_and_name'

  root to: "home#index"


end
