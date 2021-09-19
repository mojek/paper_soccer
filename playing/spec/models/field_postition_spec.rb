require_relative '../spec_helper'

describe Playing::FieldPosition do
  subject(:field_position) { described_class.new(x: 0, y: 0) }
  describe '#initialize' do
    it 'creates new object' do
      expect(field_position.to_s).to eq('FieldPosition[0,0]')
    end
  end

  describe 'equality' do
    it 'is equal' do
      expect(field_position).to eq(described_class.new(x: 0, y: 0))
    end

  end

  describe '#add_direction' do
    it 'can move direction N' do
      direction = Playing::Direction.new(name: 'N')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[0,1]')
    end

    it 'can move direction NE' do
      direction = Playing::Direction.new(name: 'NE')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[1,1]')
    end

    it 'can move direction E' do
      direction = Playing::Direction.new(name: 'E')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[1,0]')
    end

    it 'can move direction SE' do
      direction = Playing::Direction.new(name: 'SE')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[-1,-1]')
    end

    it 'can move direction S' do
      direction = Playing::Direction.new(name: 'S')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[0,-1]')
    end

    it 'can move direction SW' do
      direction = Playing::Direction.new(name: 'SW')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[-1,-1]')
    end

    it 'can move direction W' do
      direction = Playing::Direction.new(name: 'W')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[-1,0]')
    end
    it 'can move direction NW' do
      direction = Playing::Direction.new(name: 'NW')
      new_field_position = field_position.add_direction(direction)
      expect(new_field_position.to_s).to eq('FieldPosition[-1,1]')
    end

  end

end
