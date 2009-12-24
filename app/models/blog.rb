class Blog < ActiveRecord::Base
  belongs_to :blog_group
  has_many :comments
  
  def bf_content
    "#{title}\n\n#{content}"
  end
end
