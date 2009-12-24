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
  
  def self.all_content
    returning content = "" do
      BlogGroup.all.each do |bg|
        bg.blogs.each do |blog|
           content << blog.bf_content + "\n===\n"
        end
        content << "\n\n======\n\n"
      end
    end
  end
end
