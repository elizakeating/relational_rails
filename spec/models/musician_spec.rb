require "rails_helper"

RSpec.describe Musician,type: :model do
  describe "relationships" do
    it { should belong_to :orchestra }
  end
end