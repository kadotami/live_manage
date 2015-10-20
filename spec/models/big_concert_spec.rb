require 'rails_helper'

RSpec.describe BigConcert, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before { @big_concert = BigConcert.new(year: 2014, season: 0) }
  subject { @big_concert }

  it { is_expected.to respond_to(:year) }
  it { is_expected.to respond_to(:season) }

  describe "when year is not present" do
    before {@big_concert.year = " " }
    it {is_expected.to be_invalid }
  end
end
