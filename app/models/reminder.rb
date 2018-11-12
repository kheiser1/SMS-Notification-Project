class Reminder < ApplicationRecord
    belongs_to :user, :class_name => "User"
    validates :title, presence: true, length: { minimum: 5 }
    validates :date, presence: true
    validates :time, presence: true
    validates :notes, presence: true, length: { minimum: 10 }    
end
