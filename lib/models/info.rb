class Info < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: EMAIL_REGEX, allow_blank: true
  validates :phone, numericality: true,
                    length: { minimum: 5, maximum: 10 },
                    allow_blank: true
end
