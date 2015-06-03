class User < ActiveRecord::Base
    has_many :jobs
    before_save {self.email = email.downcase }
    validates :username, presence: true, length: { minimum: 2, maximum: 40}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105},
                                uniqueness: { case_sensitive: false },
                                format: { with: VALID_EMAIL_REGEX }
    validates :experstise, presence: true, length: { minimum: 10, maximum: 100}
    validates :experience, presence: true, length: { minimum: 4, maximum: 100}
    validates :skills, presence: true, length: { minimum: 10, maximum: 500}
    validates :location, presence: true, length: { minimum: 2, maximum: 25}
end
