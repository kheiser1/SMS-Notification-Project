class User < ActiveRecord::Base
    has_secure_password
    validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
    validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update    
    has_many :reminders, :class_name => "Reminder"
end
