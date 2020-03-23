class CreateSymptoms < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :sym_cough, :boolean
    add_column :readings, :sym_short_breath, :boolean
    add_column :readings, :sym_fatigue, :boolean
    add_column :readings, :sym_sore_throat, :boolean
    add_column :readings, :sym_runny_nose, :boolean
    add_column :readings, :sym_aches, :boolean
    add_column :readings, :sym_vomiting, :boolean
    add_column :readings, :sym_diarrhea, :boolean
  end
end
