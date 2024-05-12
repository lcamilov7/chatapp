class Message < ApplicationRecord
  after_create_commit { broadcast_append_to self.room } # Cuando un mensaje se cree haremos broadcast al room en el que fue creado y lo que sera broadcasted será un partial que renderice el mensaje y necesitamos un turbo stream from que reciba el mensaje para insertarlo en el div cuyo id debe ser el mismo el del turbo stream from

  belongs_to :user
  belongs_to :room

  validates :content, presence: true, length: { in: 1..200 }
end
