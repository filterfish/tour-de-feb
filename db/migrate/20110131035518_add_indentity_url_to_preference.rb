class AddIndentityUrlToPreference < ActiveRecord::Migration
  def self.up
    add_column :preferences, :blog_or_twitter, :text
  end

  def self.down
    remove_column :preferences, :blog_or_twitter
  end
end
