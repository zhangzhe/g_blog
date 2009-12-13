class BlogGroup < ActiveRecord::Base
  has_many :upload_files
  has_many :blogs
  has_one :english
  has_one :chinese
  
  def title
    "#{chinese.try(:title)}(#{english.try(:title)})"
  end
  
  def content
    "#{chinese.try(:title)}/n/n#{chinese.try(:content)}/n/n/n#{english.try(:title)}/n/n#{english.try(:content)}"
  end
end
