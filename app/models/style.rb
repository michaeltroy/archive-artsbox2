class Style < ActiveRecord::Base

  belongs_to :user
  
  has_attached_file :background, 
                    :styles => { :small => "144x144#", :smaller => "48x48#"},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "arts-box-#{::Rails.env}"
                      
  # Paperclip validation
  validates_attachment_size :background, :less_than => 464.kilobytes
  validates_attachment_content_type :background, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end