class Game < ApplicationRecord
    validates :game_name, presence:true
    has_many :game_playeds 
    has_many :users, through: :game_playeds
    has_many :game_comments
    has_many :users, through: :game_comments
end
