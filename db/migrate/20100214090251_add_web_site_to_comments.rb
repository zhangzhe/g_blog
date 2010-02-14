class AddWebSiteToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :web_site, :string
  end

  def self.down
    remove_column :comments, :web_site
  end
end
