class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait_title

  def clickbait_title
    phrases = ["Won't Believe", "Secret", "Top", "Guess"]

    if title.present? && !phrases.any? { |phrase| title.include?(phrase) }
      errors.add(:title, "title is not clickbait-y")
    end
  end
end
