class AddTitleToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :title, :string
  end
end
