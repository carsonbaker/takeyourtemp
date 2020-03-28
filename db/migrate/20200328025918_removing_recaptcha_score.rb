class RemovingRecaptchaScore < ActiveRecord::Migration[6.0]
  def change
    remove_column :readings, :recaptcha_score
  end
end
