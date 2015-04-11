class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :is_confirmed, :boolean
    add_column :profiles, :is_waiting, :boolean, default: true
    add_column :users, :group_id, :integer
  end
end
