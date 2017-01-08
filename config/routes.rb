Rails.application.routes.draw do
  root "application#home"

  resources :quizzes do
    resources :trivia_questions
  end
end
