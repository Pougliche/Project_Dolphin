class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :game_name
      t.string :platform
      t.string :genre
      t.text :description
      t.timestamps
    end
  end
end
