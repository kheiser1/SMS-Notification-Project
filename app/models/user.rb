class User < ActiveRecord::Base
    has_secure_password
    has_many :reminders, :class_name => "Reminder"
end
