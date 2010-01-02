class English < Blog
  belongs_to :blog_group
  
  def brother
    blog_group.chinese
  end
end
