class CreateBlogGroups < ActiveRecord::Migration
  def self.up
    create_table :blog_groups do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :blog_groups     
  end
end
