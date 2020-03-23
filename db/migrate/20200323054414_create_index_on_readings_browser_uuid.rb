class CreateIndexOnReadingsBrowserUuid < ActiveRecord::Migration[6.0]
  def change
    add_index :readings, :browser_uuid
  end
end
