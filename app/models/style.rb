class Style < ApplicationRecord
    
    has_many :items, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true
    
end
