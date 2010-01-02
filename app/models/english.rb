class English < Blog
  belongs_to :blog_group
  
  def to_param
    "#{id}-#{u_title}"
  end
  
  def brother
    blog_group.chinese
  end
end
