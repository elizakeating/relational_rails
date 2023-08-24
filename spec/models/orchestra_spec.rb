require "rails_helper"

RSpec.describe Orchestra,type: :model do
  describe "relationships" do
    it { should have_many :songs }
  end
end