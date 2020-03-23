class AddBrowserUuidToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :browser_uuid, :string
  end
end
