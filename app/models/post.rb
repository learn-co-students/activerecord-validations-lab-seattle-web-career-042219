class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :clickbait



  private

  def clickbait
      words = ["Won't Believe", "Secret", "Top","Guess"]
      status = false

      if title != nil
      words.each do |word|
        if title.include?(word)
          status = true
        end
      end

      if status == false
        errors.add(:title, "title not clickbait-y")
      end
      end
    end
end
