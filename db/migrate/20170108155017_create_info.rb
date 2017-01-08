class CreateInfo < ActiveRecord::Migration[5.0]
  def change
    create_table :info do |t|
      t.string :type
      t.string :image_url
      t.string :locations
      t.string :notable
      t.text :description

      t.timestamps
    end
  end
end
