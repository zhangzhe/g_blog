class CreatePinyins < ActiveRecord::Migration
  def self.up
    create_table :pinyins do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :pinyins
  end
end
