class Reply < ActiveRecord::Base
  has_one :conversation
  belongs_to :user	
end
