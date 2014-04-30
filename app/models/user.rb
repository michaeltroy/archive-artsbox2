require 'digest/sha2'

class User < ActiveRecord::Base

  #include UserConcern

  # URL structure => "artsbox.com/permalink/*". 
  def to_param
    self.permalink
  end
  
  # Permalink formatting => "artsbox.com/perma-link/*". 
  def after_validation_on_create
    self.permalink = permalink.gsub(/[^a-z0-9]+/i, '-').downcase
  end
  
# HUMANIZED_COLUMNS = {:permalink => "Message"} 
# 
# def self.human_attribute_name(attribute) 
#   HUMANIZED_COLUMNS[attribute.to_sym] || super 
# end 
    
  # Filters. String generated from current datetime, randomized then hashed.
  before_create :make_activation_code

  # Relationships.
  belongs_to  :account  
  has_one     :style,       :dependent => :destroy
  has_many    :posts,       :dependent => :destroy
  has_many    :comments,    :dependent => :destroy
  has_many    :images,      :dependent => :destroy
  has_many    :events,      :dependent => :destroy
  has_many    :newsletters, :dependent => :destroy
  
  has_many  :friendships
  has_many  :friends, :through => :friendships
  
  has_many  :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many  :inverse_friends, :through => :inverse_friendships, :source => :user
  
  # Avatar. Avater creation via Paperclip.  
  has_attached_file :avatar, 
                    :styles => { :original => "144x144#", :small => "48x48#", :tiny => "24x24#" },
                    :default_url => "/images/missing/box_:style.gif",
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "arts-box-#{::Rails.env}"
                    
# # Avatar validation.
#  validates_attachment_size :avatar, :less_than => 1000.kilobytes, :message => "Sorry, your image size is too big."
#  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif'], :message => "Sorry, your image needs to be a jpg"                    
#  
##  # Permalink validation.
#  validates_presence_of :permalink, :message => "You need to create a unique <b>user address</b>."
#  validates_format_of :permalink, :with => /^[A-Za-z0-9-]+$/, :multiline => true, :message => "A <b>user address</b> can only contain letters, numbers or dashes."    
#  validates_length_of :permalink, :minimum => 4, :message => "Your <b>user address</b> must be 4 or more characters long."
#  validates_exclusion_of :permalink, :in => %w(permalink login logout new_password resource terms-of-service faqs support blog billing account api help michael michael-troy mike carla carlafeltham engineactive artsbox), :message => "Sorry, that <b>user address</b> has been taken."
#  validates_uniqueness_of :permalink, :message => "Sorry, that <b>user address</b> has been taken."
#
### Username validation.
#  validates_presence_of :username, :message => "Please choose a <b>username</b>."
#  validates_format_of :username, :with => /^[A-Za-z0-9\s+-]+$/, :multiline => true, :message => "A <b>username</b> can only contain letters, numbers, spaces or dashes."  
#  validates_uniqueness_of :username, :case_sensative => true, :message => "Sorry, that <b>username</b> has been taken."
#  
### Email validation.
#  validates_presence_of :email, :message => "You are missing an <b>email address</b>"
#  validates_uniqueness_of :email, :message => "This <b>email address</b> is already in our system."
#  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i, :message => "Looks like your <b>email adress</b> is an invalid format"
#  
### spam protection
#  validates_length_of :blank, :maximum => 0, :message => "You must be a nasty bot!"
#  
  ## User authentication, activation and session management.
  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation

  # Password generation
  def password=(password)
    @password = password
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.password_salt, self.password_hash = 
    salt, Digest::SHA256.hexdigest(password + salt)
  end
  
  # Authenticate User.
  def self.authenticate(email, password)
    user = User.find(:first, :conditions => ['email = ? and activated_at IS NOT NULL', email])
      if user.blank? || Digest::SHA256.hexdigest(password + user.password_salt) != user.password_hash
        raise "Your email or password are invalid"
      end
    user
  end
  
  # Does user exist? Check account for password reset etc.
  def self.does_user_exist(email)
    User.find(:first, :conditions => ['email = ?', email])
   # has_user_been_activated
  end
  
  # Account activation.
  def activate
    @activated = true
    update_attributes(:activated_at => Time.now.utc, :activation_code => nil)
  end
  
  def recently_activated?
    @activated
  end
  
  protected
  # Generate new random password
  def self.generate_random_password(length)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    new_password = ""
    1.upto(length) { |i| new_password << chars[rand(chars.size-1)] }
    return new_password
  end
  
  def make_activation_code
    self.activation_code = Digest::SHA256.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join).first(40)
  end
  
  ## Find methods.
  # Find the most newly activated Users.
  def self.latest_users
    User.find(:all, :conditions => ["activated_at IS NOT NULL"], :limit => 24, :order => "created_at DESC")
  end

end