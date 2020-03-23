class AddHouseholdNoToReadings < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :household_person, :integer
  end
end
