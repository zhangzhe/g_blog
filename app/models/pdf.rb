class Pdf < ActiveRecord::Base
  has_attachment :storage => :s3, :s3_config_path => (RAILS_ROOT + '/config/amazon_s3.yml')
end
