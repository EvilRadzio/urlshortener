class ShortenedUrl < ApplicationRecord
  belongs_to :user
  validates :original_url, presence: true
  validates :short_url, presence: true, uniqueness: true, length: { is: 9 }, format: { with /\A[a-zA-Z0-9]{9}\z/] }
  before_validation :ensure_short_url, on :create

  private
  
  def ensure_short_url
 	return if short_url.present?
	loop do
	  candidate = SecureRandom.alphanumeric(9)
	  unless self.class.exists?(short_url: candidate)
	    self.short_url = candidate
	    break
	end
  end
end
