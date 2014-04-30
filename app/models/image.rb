class Image < ActiveRecord::Base
  
  belongs_to :user
  
  has_attached_file :image, 
                    :styles => { :two_four => "24x24#", :four_eight => "48x48#", 
                                 :six_four => "64x64#", :one_two_four => "124x124#", 
                                 :one_six_eight => "168x168#", :six_two_four => "624x624>"},
                    :storage => :s3,             
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "arts-box-#{::Rails.env}"
                    
  # Paperclip validation
  validates_attachment_size :image, :less_than => 1000.kilobytes
  validates_attachment_content_type :image, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif']

end