class User < ApplicationRecord
    has_many :orders, dependent: :destroy

    validates_presence_of :name
    validates :cpf, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }, format: { with: /\A(\S+)@(.+)\.(\S+)\z/ }
end
