class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :creator, index: true
      t.string :event_name
      t.string :city
      t.integer :max_participant
      t.datetime :event_date
      t.integer :duration
      t.text :description
      t.string :game_played
      t.timestamps
    end
  end
end
