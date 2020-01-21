class Event < ApplicationRecord
 
    has_many :attendances
    has_many :users, through: :attendances
    validates :event_date, presence: true
    validate :event_start
    validates :duration, presence: true
    validate :time_gate
    validates :event_name, length: { minimum: 5 , maximum: 140 }
    validates :city, presence: true
    validates :game_played, presence: true
    has_many :event_comments
    has_many :users, through: :event_comments
    belongs_to :creator, class_name: "User"
    has_many_attached :images
    


    def event_start 
        unless  event_date > Time.zone.today
                event_date.errors[:time] << 'event cannot be in the past'
        end
    end

    def event_time
        event_date.strftime("%m/%d/%y at %l:%M %p")
    end 

    def time_gate
            if (duration%5!= 0)
                errors.add(:duration, message: "duration must be a multiple of 5")
            end
        end
end
