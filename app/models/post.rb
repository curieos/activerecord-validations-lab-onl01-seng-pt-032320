class Post < ActiveRecord::Base
  validates :title, presence: true
  validates_length_of :content, minimum: 250
  validates_length_of :summary, maximum: 250
  validates_inclusion_of :category, in: %w[Fiction Non-Fiction]
  validate :post_is_clickbait

  def post_is_clickbait
    return unless title

    unless ["Won't Believe", 'Secret', 'Top', 'Guess'].any? { |s| title.include?(s) }
      errors.add(:title, 'isn\'t clickbait')
    end
  end
end
