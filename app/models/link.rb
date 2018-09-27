class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: { case_sensitive: false }
  validates :shortened, presence: true, uniqueness: { case_sensitive: false }
end
