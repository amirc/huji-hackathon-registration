class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :is_female
      t.string :phone
      t.string :academic_institute
      t.string :academic_degree
      t.integer :academic_year
      t.string :shirt_size
      t.string :food_diet
      t.boolean :need_lab_comp
      t.boolean :need_extra_help
      t.text :experience
      t.references :cur_user, index: true
    end
  end
end
