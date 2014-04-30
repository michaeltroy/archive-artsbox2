class Comment < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :post
  has_many    :streams, :as => :streamer
    
  validates_presence_of :body
  
end
