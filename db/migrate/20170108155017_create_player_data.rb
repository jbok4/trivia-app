class CreatePlayerData < ActiveRecord::Migration[5.0]
  def change
    create_table :player_data do |t|
      t.string :type
      t.string :image_url
      t.string :locations
      t.string :notable
      t.text :description

      t.timestamps
    end
  end
end
