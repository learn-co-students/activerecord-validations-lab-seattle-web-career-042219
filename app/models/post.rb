class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {:in => ['Fiction', 'Non-Fiction']}
  validate :non_clickbait


  private
  def non_clickbait
    if title != nil
      if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
        errors.add(:title, "Not sufficiently clickbait-y!")
      end
    else
      errors.add(:title, "Title can't be empty.")
    end
  end

end
