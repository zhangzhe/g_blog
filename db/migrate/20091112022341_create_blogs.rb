class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :title, :type
      t.text :content
      t.integer :blog_group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
