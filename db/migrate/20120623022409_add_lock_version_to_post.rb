class AddLockVersionToPost < ActiveRecord::Migration
  def change
    add_column :posts, :lock_version, :integer, :default => 0
  end
end
