class AddUniqueIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :unique_id, :integer
  end
end
