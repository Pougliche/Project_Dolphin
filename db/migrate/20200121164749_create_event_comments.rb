class CreateEventComments < ActiveRecord::Migration[5.2]
  def change
    create_table :event_comments do |t|
      t.text :comment
      t.belongs_to :user
      t.belongs_to :event
      t.timestamps
    end
  end
end
