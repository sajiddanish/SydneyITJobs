class Job < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :summary, presence: true, length: {minimum: 10, maximum: 500}
    validates :description, presence: true, length: {minimum: 10, maximum: 1500}
end