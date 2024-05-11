class Room < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { in: 4..20 }
  scope :public_rooms, -> { where(is_private: false) } # Scope para fetch los rooms publicos de nuestra lista
  after_create_commit {broadcast_append_to "rooms"} # Vamos a broadcast para el channel rooms para cuando haya una nueva instancia de Room, para eso el after_create_commit
end
