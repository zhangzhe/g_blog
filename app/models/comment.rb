class Comment < ActiveRecord::Base
  belongs_to :blog, :touch => true
end
