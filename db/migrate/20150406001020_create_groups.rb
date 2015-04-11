class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :idea
      t.boolean :is_looking_for
      t.string :looking_for
      t.references :admin, index: true

      t.timestamps
    end
  end
end
