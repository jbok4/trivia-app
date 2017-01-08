class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.integer :correctAnswers

      t.timestamps
    end
  end
end
