require 'migration_helpers'

class AddForeignKeys < ActiveRecord::Migration

  extend ::MigrationHelpers

  def self.up
    foreign_key :rides, :user_id, :users
    foreign_key :users, :group_id, :groups
    foreign_key :preferences, :user_id, :users
  end

  def self.down
    drop_foreign_key :rides, :user_id
    drop_foreign_key :users, :group_id
    drop_foreign_key :preferences, :user_id
  end
end
