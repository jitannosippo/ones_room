class Item < ApplicationRecord
    
    has_one_attached :image
    
    belongs_to :genre
    belongs_to :style
    belongs_to :admin
    
    has_many :favorites, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :order_items
    
    validates :name, presence: true
    validates :explanation, presence: true
    validates :price, presence: true
    # validates_associated :genres
    # validates_associated :styles

    
    def favorited_by?(customer)
	    favorites.exists?(customer_id: customer.id)
    end
    
    def avg_score
        # selfはitemのこと。itemに結びついているreviewが空ではない時。
        unless self.reviews.empty?
            reviews.average(:score).round(1).to_f
        else
            0.0
        end
    end
    
    def review_score_percentage
        unless self.reviews.empty?
            reviews.average(:score).round(1).to_f * 100/5
        else
            0.0
        end
    end
    
end
