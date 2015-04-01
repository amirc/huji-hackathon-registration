class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :skills, :string
    add_column :profiles, :public_about, :text
    add_column :profiles, :is_confirmed, :boolean
    add_column :profiles, :is_waiting, :boolean, default: true
  end
end
