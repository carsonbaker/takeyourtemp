class AddScoreToReading < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :recaptcha_score, :float
  end
end
