class BlogGroup < ActiveRecord::Base
  has_many :upload_files
  has_many :blogs
end
