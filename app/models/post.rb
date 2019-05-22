require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 20}
  validates :summary, length: {maximum: 50}
  validates :category, inclusion: {in: %w(Fiction)}
  validate :clickbait


  private

  def clickbait

    if title == nil
    errors.add(:title, "need a title!")
    elsif !title.include?("Won't Believe")
      errors.add(:title, "doesn't include clickbait")
    end
  end

end
