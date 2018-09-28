require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url).case_insensitive }

  it { should validate_presence_of(:shortened) }
  it { should validate_uniqueness_of(:shortened) }

  it {
      should allow_values(
        'https://git.io',
        'http://git.io',
        'https://GiT.iO',
        'http://git.io/abx1'
      ).for(:url)
  }

  it {
    should_not allow_values(
      'git.io',
      'abc',
      'abc.com'
    ).for(:url)
  }


end
