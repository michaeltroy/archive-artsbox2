class Event < ActiveRecord::Base
  
  ## Relationships
  belongs_to        :user
  has_attached_file :image, 
                    :styles => { :large => "224x224>", :original => "144x144#", 
                                 :small => "48x48#", :tiny => "24x24#"},
                    :default_url => "/images/missing/event_:style.gif",
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "arts-box-#{ENV}"              
                    
                    
  # Extract from database                  
  def self.latest_events
    Event.find(:all, :limit => 4, :order => "created_at DESC")
  end
  
  ## Need to refactor - legacy code
  def self.starts_today
    starts_today = Event.find(:all, :order => :start_time, 
    :conditions => ["start_date = ?", Date.today])
  end
  
  def self.ends_today
    ends_today = Event.find(:all, :order => :start_time, 
    :conditions => ["end_date = ?", Date.today])
  end
    
  def self.current
    current = Event.find(:all, :limit => 12, :order => :end_date,
    :conditions => ["start_date <= ? and '#{Date.today}' < end_date 
                    and start_date!= ? and end_date != ?", Date.today, Date.today, Date.today])
  end
  
  def self.upcoming
    upcoming = Event.find(:all, :limit => 12,
    :order => :start_date, :conditions => ["start_date > ?", Date.today])
  end
  
  def self.past
    past = Event.find(:all, 
    :order => 'end_date DESC', 
    :conditions => ["end_date < ? and start_date < ? || end_date = ? and start_date < ?", 
                     Date.today, Date.today, '', Date.today])
  end
  
end
