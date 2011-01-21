class CreatePreferences < ActiveRecord::Migration
  def self.up
    create_table :preferences do |t|
      t.integer :user_id
      t.string :time_zone, :default => 'Sydney'
      t.boolean :metric, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :preferences
  end
end
