class BlogGroup < ActiveRecord::Base
  has_many :upload_files
  has_many :blogs
  has_one :english
  has_one :chinese
  
  def title
    "#{chinese.try(:title)}(#{english.try(:title)})"
  end
end
