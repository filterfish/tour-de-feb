class SplitRideTime < ActiveRecord::Migration
  def self.up
    #change_column :rides, :date, :date
    add_column :rides, :time, :time

    Ride.all.each do |ride|
      ride.time = ride.date
      ride.save
    end

    change_column :rides, :date, :date
  end

  def self.down
    change_column :rides, :date, :datetime
    remove_column :rides, :time
  end
end
