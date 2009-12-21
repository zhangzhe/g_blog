class Blog < ActiveRecord::Base
  belongs_to :blog_group
  has_many :comments
end
