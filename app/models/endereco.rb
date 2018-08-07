class Endereco < ApplicationRecord
  belongs_to :contato, optional: true
end
