class Stream < ActiveRecord::Base
  
 belongs_to :streamer, :polymorphic => true
 #belongs_to :post
  
  def self.public_stream_actions
    Stream.find(:all,  :limit => 12, :order => "created_at DESC")
  end
  
end
