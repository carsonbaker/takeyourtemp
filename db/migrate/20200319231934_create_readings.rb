class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.float :temp_f
      t.integer :age
      t.integer :zipcode
      t.string :sex
      t.string :site
      t.datetime :created_at
    end
  end
end
