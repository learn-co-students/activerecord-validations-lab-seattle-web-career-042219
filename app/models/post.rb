# frozen_string_literal: true

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :clickbait?

  CLICKBAIT_ARR = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [0-9]/i].freeze

  def clickbait?
    errors.add(:title, 'must be clickbait') unless CLICKBAIT_ARR.any? { |pat| pat.match(title) }
  end
end
