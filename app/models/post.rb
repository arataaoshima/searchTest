class Post < ApplicationRecord

  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories

  def self.search(title,user_id)

      if title.present? and user_id.present?
          Post.where(['title LIKE ?', "%#{title}%"]).where(['user_id = ?', user_id])
      elsif title.present? and user_id.blank?
          Post.where(['title LIKE ?', "%#{title}%"])
      elsif title.blank? and user_id.present?
          Post.where(['user_id = ?', user_id])
      else
          Post.all
      end

  end

end
