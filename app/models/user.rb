class User < ApplicationRecord
  before_save :downcase_username
  after_create_commit { broadcast_append_to 'users' } # Esto servirá para escuchar o broadcast cualquier nueva instancia de user agregada a un channel en particular con ActionCable, en esta ocasion el canal se llama users, Le decimos al modelo User que broadcast al channel llamado users cuando una nueva instancia de User sea creada

  has_secure_password

  validates :username, presence: true, uniqueness: true,
    length: { in: 4..15 },
    format: {
      with: /\A[a-z0-9A-Z]+\z/,
      message: 'invalid, only letter and number allowed' # o message: :invalid
    }
  validates :password, presence: true, length: { minimum: 7 }
  # Este scope para hcer un fetch de todos los usuarios excepto el usuario actual de nuestra lista de usuarios, no queremos que inicia un chat consigo mismo
  scope :all_except, ->(user) { where.not(id: user) } # Podremos llamarlo User.all_except

  private

  def downcase_username
    self.username = self.username.downcase
  end
end
