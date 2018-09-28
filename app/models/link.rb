class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: { case_sensitive: false }, url: true
  validates :shortened, presence: true, uniqueness: true
end
