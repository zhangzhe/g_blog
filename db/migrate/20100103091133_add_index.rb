class AddIndex < ActiveRecord::Migration
  def self.up
    add_index :blogs, :blog_group_id
    add_index :upload_files, :blog_group_id
    add_index :comments, :blog_id
  end

  def self.down
    remove_index :blogs, :blog_group_id
    remove_index :upload_files, :blog_group_id
    remove_index :comments, :blog_id
  end
end
