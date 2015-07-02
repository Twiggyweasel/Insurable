class User < ActiveRecord::Base
    has_many :rooms
    has_many :homes
    has_many :items
    accepts_nested_attributes_for :homes
    
    before_save { self.email = email.downcase }
    #validates :user_name, presence: true, length: { minimum: 3, maximum: 40 } 
    VALIDATE_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, presence: true, length: { maximum: 105 }, 
                                      uniqueness: { case_sensitive: false}, 
                                      format: { with: VALIDATE_EMAIL_REGEX }
    has_secure_password
    
    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.password_reset(self).deliver_now
    end
   
   def generate_token(column)
      begin
      self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
   end
end
