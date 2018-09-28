require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url).case_insensitive }

  it { should validate_presence_of(:shortened) }
  it { should validate_uniqueness_of(:shortened) }

  it { should have_many(:redirects) }

  # URL Validity
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

  # Base62 Validity
  it {
      should allow_values(
        '1',
        '23x',
        'wEq2',
        'xErQxW23152W'
      ).for(:shortened)
  }

  it {
    should_not allow_values(
      'a b',
      'a21.w',
      'qwex@2'
    ).for(:shortened)
  }
end
