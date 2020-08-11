class User < ApplicationRecord
    has_many :allergies
    has_many :ingredients, through: :allergies
    has_many :recipes
    validates :name, uniqueness: { message: "That User name already exists." }
end
