class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :receiver, foreign_key: 'receiver_id', class_name: "User"
end