class Chinese < Blog
  belongs_to :blog_group
  def brother
    return blog_group.english
  end
end
