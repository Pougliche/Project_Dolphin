class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email,  presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adresse please"}
         validates :email, uniqueness: true
         validates :password, length: { minimum: 6 }
         has_many :attendances
         has_many :events, through: :attendances
         has_many :created_events, foreign_key: 'creator_id', class_name: "Event"
         has_many :game_playeds 
         has_many :games, through: :game_playeds
         has_many :game_comments
         has_many :games, through: :game_comments
         has_many :event_comments
         has_many :events, through: :event_comments
         has_many :conversations, :foreign_key => :sender_id
end
