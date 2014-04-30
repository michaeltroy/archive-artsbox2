class Post < ActiveRecord::Base
  
  # Uses ':id-:title/' in URL
  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"    
  end
  
  HUMANIZED_COLUMNS = {:title => "Message"} 
  
  def self.human_attribute_name(attribute) 
    HUMANIZED_COLUMNS[attribute.to_sym] || super 
  end
  
  # Relationships
  belongs_to  :user
  has_many    :comments, :dependent => :destroy

  # Validations
  validates_presence_of :title, :message => "Your post needs a title."
  
  def self.friends_posts
    Post.all#, :include => :user
  end
  
  # GET the latest 6 posts
  def self.latest_posts
    Post.all#, :limit => 6, :order => "created_at DESC"
  end
  
end