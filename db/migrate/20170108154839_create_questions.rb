class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
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
