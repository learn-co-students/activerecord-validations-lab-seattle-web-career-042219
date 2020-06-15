class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :clickbait

  def is_clickbait?
    baity = false
    baits = ["Won't Believe", "Secret", "Top #{/d/}", "Guess"]
    baits.each do |word|
      if self.title.include?(word)
        baity = true
      end
    end
    baity
  end

def clickbait
  if self.title
    errors.add(:title, "is not clickbait-y enough") unless self.is_clickbait?
  end
end

end
