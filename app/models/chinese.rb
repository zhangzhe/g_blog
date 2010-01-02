class Chinese < Blog
  belongs_to :blog_group
  
  def brother
    blog_group.english
  end
end
