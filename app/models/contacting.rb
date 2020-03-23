class Contacting
  include ActiveModel::Model
  attr_accessor :message, :from

  validates :message, presence: true, length: 4..800
  validates :from, format: { with: URI::MailTo::EMAIL_REGEXP }

end

