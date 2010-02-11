class CreatePdfs < ActiveRecord::Migration
  def self.up
    create_table :pdfs do |t|
      t.integer :size
      t.string :filename, :content_type
      t.timestamps
    end
  end

  def self.down
    drop_table :pdfs
  end
end
