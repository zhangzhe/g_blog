class AddUTitleToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :u_title, :string
  end

  def self.down
    remove_column :blogs, :u_title
  end
end
