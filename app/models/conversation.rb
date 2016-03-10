class Conversation < ActiveRecord::Base
  has_many :replies
  
end
