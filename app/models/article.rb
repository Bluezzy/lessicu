class Article < ApplicationRecord
    belongs_to :category
    has_and_belongs_to_many :themes
    has_many :words, through: :themes
    has_one_attached :image
    validates :title, presence: true, uniqueness: true
    validates :content, presence: true
    validates :author, presence: true

    def self.update_dependent_articles_after_deleted_category(deleted_category_id)
        other_category_id = Category.find_by(name: "autre").id
        Article.where(category_id: deleted_category_id).update_all(category_id: other_category_id)
    end
end
