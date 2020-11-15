class Post < ApplicationRecord
    
    has_many :favorites, dependent: :destroy
    belongs_to :user
    
    validates :title, presence: true
    validates :description, presence: true
    
    attachment :post_image
  
  
  def favorited_by?(company)
    favorites.where(company_id: company.id).exists?
  end
  
end
