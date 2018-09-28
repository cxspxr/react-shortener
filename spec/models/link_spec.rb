require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url).case_insensitive }

  it { should validate_presence_of(:shortened) }
  it { should validate_uniqueness_of(:shortened) }
end
