class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"] }
  validate :clickbaity

  private

  def clickbaity
    clickbaits = ["Won't Believe", "Secret", "Top","Guess"]
    baits = false
    if title != nil
    clickbaits.each do |word|
      if title.include?(word)
        baits = true
      end
    end
      if baits == false
        errors.add(:title, "must have clickbaits")
      end
    end
  end

end
