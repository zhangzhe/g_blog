class BlogGroup < ActiveRecord::Base
  has_many :upload_files
  has_many :blogs
  has_one :english
  has_one :chinese
end
