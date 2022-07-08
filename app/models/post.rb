class Post < ApplicationRecord
  validate :ensure_title_link_uniqueness

  private

  def ensure_title_link_uniqueness
    if Post.where(title: title, link: link, created_time: created_time).present?
      errors.add(:base, 'Post already exist.')
    end
  end
end
