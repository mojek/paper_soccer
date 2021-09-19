module Playing
  class FieldPosition < Dry::Struct
    attribute :x, Types::Integer
    attribute :y, Types::Integer
    WrongDirectionError = Class.new(StandardError)

    def add_direction(direction)
      case direction.to_s
      when 'N'
        FieldPosition.new(x: x, y: y + 1)
      when 'NE'
        FieldPosition.new(x: x + 1, y: y + 1)
      when 'E'
        FieldPosition.new(x: x + 1, y: y)
      when 'SE'
        FieldPosition.new(x: x - 1, y: y - 1)
      when 'S'
        FieldPosition.new(x: x, y: y - 1)
      when 'SW'
        FieldPosition.new(x: x - 1, y: y - 1)
      when 'W'
        FieldPosition.new(x: x - 1, y: y)
      when 'NW'
        FieldPosition.new(x: x - 1, y: y + 1)
      else
        raise WrongDirectionError
      end

    end

    def to_s
      "FieldPosition[#{x},#{y}]"
    end
  end
end
