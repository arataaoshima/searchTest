class Post < ApplicationRecord

  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories

  # def self.search(category_ids)
  #   if category_ids.present?
  #     Post.all
  #   else
  #     Post.joins(:categories).where(categories: {id:[category_ids]})
  #   end
  # end

  def self.search(title,category_ids)
    if title.present? and category_ids.length > 1
      Post.joins(:categories).where('title LIKE ?', "%#{title}%").where(categories: {id: category_ids})
    elsif title.present? and category_ids.length <= 1
      Post.joins(:categories).where('title LIKE ?', "%#{title}%")
    elsif category_ids.present? and category_ids.length > 1
      Post.joins(:categories).where(categories: {id: category_ids})
    else
      Post.all
    end
  end

  # def self.search(title,user_id)
  #   if title.present? and user_id.length > 1
  #     Post.where('title LIKE ?', "%#{title}%").where(user_id: user_id)
  #   elsif title.present? and user_id.length <= 1
  #     Post.where('title LIKE ?', "%#{title}%")
  #   elsif user_id.present? and user_id.length > 1
  #     Post.where(user_id: user_id)
  #   else
  #     Post.all
  #   end
  # end

  # def self.search(title,category_ids)

  #   #   if title.present? and user_id.present?
  #   #       Post.where(['title LIKE ?', "%#{title}%"]).where(['user_id = ?', user_id])
  #   #   elsif title.present? and user_id.blank?
  #   #       Post.where(['title LIKE ?', "%#{title}%"])
  #   #   elsif title.blank? and user_id.present?
  #   #       Post.where(['user_id = ?', user_id])
  #   #   else
  #   #       Post.all
  #   #   end

  #   # if title.present? and category_ids.present?
  #   #     Post.joins(:categories).where(['title LIKE ?', "%#{title}%"]).where(['categories.category_ids = ?', category_ids])
  #   # elsif title.present? and category_ids.blank?
  #   #     Post.joins(:categories).where(['title LIKE ?', "%#{title}%"])
  #   # elsif title.blank? and category_ids.present?
  #   #     Post.joins(:categories).where(['categories.id = ?', category_ids])
  #   # else
  #   #     Post.all
  #   # end

  # end

end
