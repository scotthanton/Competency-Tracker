class Conversation < ActiveRecord::Base
  has_many :replies
  belongs_to :creator, :class_name => 'User', :foreign_key => 'user_id_creator'
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'user_id_recipient'
end
