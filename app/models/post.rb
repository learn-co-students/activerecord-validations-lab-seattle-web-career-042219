class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbait?

    #learned how to use regex
     @@clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    #none = does-not-include but != .exclude?
  def is_clickbait?
    if @@clickbait.none? { |cb| cb.match title }
      errors.add(:title, "must be clickbait")
    end
  end


end
