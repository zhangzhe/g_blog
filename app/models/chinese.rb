class Chinese < Blog
  belongs_to :blog_group
  
  def to_param
    "#{id} #{title}"
  end
  
  def brother
    blog_group.english
  end
end
