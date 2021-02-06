class User < ApplicationRecord
    has_many :orders

    validates_presence_of :name, :cpf
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }, format: { with: /\A(\S+)@(.+)\.(\S+)\z/ }
end
