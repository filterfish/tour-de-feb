class AddGoalsToPreferences < ActiveRecord::Migration
  def self.up
    add_column :preferences, :goal, :text
  end

  def self.down
    remove_column :preferences, :goal
  end
end
