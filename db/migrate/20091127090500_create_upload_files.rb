class CreateUploadFiles < ActiveRecord::Migration
  def self.up
    create_table :upload_files do |t|
      t.integer :size, :blog_id
      t.string :filename, :content_type
      t.timestamps
    end
  end

  def self.down
    drop_table :upload_files
  end
end
