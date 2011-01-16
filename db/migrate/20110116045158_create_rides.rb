class CreateRides < ActiveRecord::Migration
  def self.up
    create_table :rides do |t|
      t.integer :user_id
      t.integer :length
      t.integer :duration
      t.time :time
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :rides
  end
end
