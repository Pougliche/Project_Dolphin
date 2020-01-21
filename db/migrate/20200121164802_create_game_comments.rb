class CreateGameComments < ActiveRecord::Migration[5.2]
  def change
    create_table :game_comments do |t|
      t.text :comment
      t.belongs_to :user
      t.belongs_to :game
      t.timestamps
    end
  end
end
