class AddNoneOfTheseSymptom < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :sym_none_of_these, :boolean
  end
end
