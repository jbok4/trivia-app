class CreateTriviaQuestion < ActiveRecord::Migration[5.0]
  def change
    create_table :trivia_question do |t|
      t.string :type
      t.string :text
      t.string :possibilities
      t.integer :selected
      t.integer :correct
      t.integer :quiz_id

      t.timestamps
    end
  end
end
