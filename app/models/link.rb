class Link < ApplicationRecord
  validates_presence_of :url, :shortened
end
