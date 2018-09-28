require 'rails_helper'

RSpec.describe Redirect, type: :model do
  it { should belong_to(:link) }
end
