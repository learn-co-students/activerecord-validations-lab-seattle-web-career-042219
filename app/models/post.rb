class Post < ActiveRecord::Base
	validates :title, presence: true, format: {with: /(?i)(Won't Believe|Secret|Top [0-9]|Guess)/}
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
end
