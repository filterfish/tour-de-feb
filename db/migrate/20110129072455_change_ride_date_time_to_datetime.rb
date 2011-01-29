class ChangeRideDateTimeToDatetime < ActiveRecord::Migration
  def self.up
    change_column :rides, :date, :datetime
    remove_column :rides, :time
  end

  def self.down
    change_column :rides, :date, :date
    add_column :rides, :time, :time
  end
end
