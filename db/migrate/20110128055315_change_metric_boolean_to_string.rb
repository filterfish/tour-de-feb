class ChangeMetricBooleanToString < ActiveRecord::Migration
  def self.up
    rename_column :preferences, :metric, :bool_metric
    add_column :preferences, :metric, :string

    Preference.all.each do |pref|
      pref.metric = (pref.bool_metric) ? 'km' : 'mile'
      pref.save
    end
  end

  def self.down
  end
end
