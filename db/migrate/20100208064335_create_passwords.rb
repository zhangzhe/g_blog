class CreatePasswords < ActiveRecord::Migration
  def self.up
    create_table :passwords do |t|
      t.string :password
      t.timestamps
    end
    Password.create(:password => 1234)
  end

  def self.down
    drop_table :passwords
  end
end
