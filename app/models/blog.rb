class Blog < ActiveRecord::Base
  acts_as_taggable_on :tags
  belongs_to :blog_group
  has_many :comments
  pinyinlize :title
  
  def content_blank?
    title.blank? or content.blank?
  end
  
  def capable_tags
    tag_list.blank? ? brother.tag_list : tag_list
  end
  
  def capable_content
    title ? title : brother.title
  end
  
  def capable_title
    content ? content : brother.content
  end
  
  # not finished
  def save_type
    if self["type"].nil? # means the first time create
      if title =~ /[\xa0-\xff]/
        type = "Chinese"
        blog_group.english = English.create
      else
        type = "English"
        blog_group.chinese = Chinese.create 
      end
      self.save!
    end
  end
end
