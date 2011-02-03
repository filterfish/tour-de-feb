class FixImperialDistance < ActiveRecord::Migration
  def self.up
    execute "update rides set distance = (distance * 1.6) where user_id in (select user_id from preferences where metric = 'mile')"
  end

  def self.down
    execute "update rides set distance = (distance / 1.6) where user_id in (select user_id from preferences where metric = 'mile')"
  end
end
