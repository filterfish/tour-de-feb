class CreateRides < ActiveRecord::Migration
  def self.up
    create_table :rides do |t|
      t.integer :length
      t.integer :time
      t.datetime :date

      t.timestamps
    end
  end

  def self.down
    drop_table :rides
  end
end
