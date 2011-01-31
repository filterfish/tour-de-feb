class AddDefaultMetricPreferences < ActiveRecord::Migration
  def self.up
    change_column :preferences, :metric, :string, :default => 'km'
    remove_column :preferences, :bool_metric
  end

  def self.down
    change_column :preferences, :metric, :string
    remove_column :preferences, :bool_metric, :boolean, :default => true
  end
end
