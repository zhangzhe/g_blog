class AddDescriptionToUploadFile < ActiveRecord::Migration
  def self.up
    add_column :upload_files, :description, :text
  end

  def self.down
  end
end
