class Reminder < ApplicationRecord

  validates :hour_of_day, presence: true, inclusion: { in: 0..23 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_create :encrypt

  def encrypt
    self[:email] = cryptor.encrypt_and_sign(self[:email])
    self[:phone] = cryptor.encrypt_and_sign(self[:phone])
  end

  # def decrypt
  #   cryptor.decrypt_and_verify(self[:email])
  # end

  def cryptor
    key = Rails.application.secrets.secret_key_base.bytes[0..31].pack( "c" * 32 )
    ActiveSupport::MessageEncryptor.new(key)
  end

end

