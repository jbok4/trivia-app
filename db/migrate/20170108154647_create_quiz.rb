class CreateQuiz < ActiveRecord::Migration[5.0]
  def change
    create_table :quiz do |t|
      t.integer :correctAnswers

      t.timestamps
    end
  end
end
