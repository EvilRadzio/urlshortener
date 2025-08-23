class User < ApplicationRecord
  has_many :shortened_urls, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :api_key, presence: true, uniqueness: true
  before_validation :ensure_api_key, on: :create

  # generowanie losowego uuid i zapisywanie

  def rotate_api_key!
    update!(api_key: SecureRandom.uuid)
  end
  private

  # sprawdzanie czy jest klucz jest git

  def ensure_api_key
    self.api_key ||= SecureRandom.uuid
  end
end
