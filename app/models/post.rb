class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Nonfiction) }
    validate :title_must_be_clickbate

    def title_must_be_clickbate
        if !!self.title
            if !self.title.match?(/(Won't Believe)|(Secret)|(Top \d)|(Guess)/)
                errors.add(:title, "must be clickbait-y") 
            end
        end
    end
end

  