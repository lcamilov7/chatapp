class Room < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { in: 4..20 }
  scope :public_rooms, -> { where(is_private: false) } # Scope para fetch los rooms publicos de nuestra lista
end
