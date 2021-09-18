module Types
  include Dry.Types()
end

module Playing
  class AddLine < Dry::Struct
    DIRECTIONS = Types::String.enum('N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW')

    attribute :aggregate_id, Types::Coercible::Integer
    attribute :user_id, Types::Coercible::Integer
    attribute :direction, DIRECTIONS
  end
end
