class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    
    belongs_to :prefecture
    
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :url, format: /\A#{URI::regexp(%w(http https))}\z/, length: { maximum: 255 }, on: :update
    validates :self_introduction, length: { maximum: 1000 }, on: :update
    has_secure_password
end
