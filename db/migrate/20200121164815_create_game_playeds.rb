class CreateGamePlayeds < ActiveRecord::Migration[5.2]
  def change
    create_table :game_playeds do |t|
      t.string :player_skill
      t.belongs_to :user
      t.belongs_to :game
      t.timestamps
    end
  end
end
