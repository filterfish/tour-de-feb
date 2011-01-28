class ChangeDistanceTypeToDecmial < ActiveRecord::Migration
  def self.up
    rename_column :rides, :length, :distance
    change_column :rides, :distance, :decimal, :precision => 6, :scale => 2
  end

  def self.down
    rename_column :rides, :distance, :length
    change_column :rides, :length, :integer
  end
end
