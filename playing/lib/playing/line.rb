module Playing
  class Line
    attr_accessor :field_one
    attr_accessor :field_two

    def initialize(field_position_one, field_position_two)
      @field_one = field_position_one
      @field_two = field_position_two
    end

    def ==(other)
      (field_one == other.field_one and field_two == other.field_two) or
        (field_one == other.field_two and field_two == other.field_one)
    end
  end
end