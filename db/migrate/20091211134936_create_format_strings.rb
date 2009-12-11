class CreateFormatStrings < ActiveRecord::Migration
  def self.up
    create_table :format_strings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :format_strings
  end
end
