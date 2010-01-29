class Blog < ActiveRecord::Base
  acts_as_taggable_on :tags
  belongs_to :blog_group
  has_many :comments
  require "pinyin"
  after_save do |blog|
    Blog.transaction do 
      new_u_title = PinYin.instance.to_permlink(blog.title) if blog.title
      blog.update_attributes(:u_title => new_u_title) unless new_u_title == blog.u_title
    end
  end
  
  def to_param
    return "#{id}-#{u_title}"
  end
end
