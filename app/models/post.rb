class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait

  def is_clickbait
    @@phrases = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]

    if @@phrases.any? do |phrase|
      phrase.match(self.title)
      # binding.pry
    end
    else
      errors.add(:title, "Title is not clickbait")
    end
  end
end
