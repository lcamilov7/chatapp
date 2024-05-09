class User < ApplicationRecord
  before_save :downcase_username

  has_secure_password

  validates :username, presence: true, uniqueness: true,
    length: { in: 4..15 },
    format: {
      with: /\A[a-z0-9A-Z]+\z/,
      message: 'invalid, only letter and number allowed' # o message: :invalid
    }
  validates :password, presence: true, length: { minimum: 7 }

  # Este scope para hcer un fetch de todos los usuarios excepto el usuario actual de nuestra lista de usuarios, no queremos que inicia un chat consigo mismo
  # scope :all_except, ->(user) { where.not(id: user) } # Current.user.id

  private

  def downcase_username
    self.username = self.username.downcase
  end
end
