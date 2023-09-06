class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :score, presence:true
  
  
  # 星５つ中何点かを表示
  def avg_score
    # selfはitemのこと。itemに結びついているreviewが空ではない時。
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
    
  # 一つの商品に対するレビューの総合
  def review_score_percentage
      unless self.reviews.empty?
        reviews.average(:score).round(1).to_f * 100/5
      else
        0.0
      end
  end
  
  
end
