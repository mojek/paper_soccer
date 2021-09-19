require_relative '../spec_helper'

describe Playing::Line do
  describe 'equality' do
    it "is equal" do
      point1 = Playing::FieldPosition.new(x: 0, y: 0)
      point2 = Playing::FieldPosition.new(x: 0, y: 1)
      line1 = described_class.new(point1, point2)
      line2 = described_class.new(point2, point1)
      expect(line1==line2).to be_truthy
    end

    it "is also qual" do
      point1 = Playing::FieldPosition.new(x: 0, y: 0)
      point2 = Playing::FieldPosition.new(x: 0, y: 1)
      line1 = described_class.new(point1, point2)
      line2 = described_class.new(point2, point1)
      lines = []
      lines << line1
      expect(lines.include?(line2)).to be_truthy
    end
  end
end