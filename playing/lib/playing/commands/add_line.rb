module Types
  include Dry.Types()
end

module Playing
  class AddLine < Dry::Struct
    DIRECTIONS = Types::String.enum('N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW')

    attribute :play_id, Types::UUID
    attribute :user_id, Types::UUID
    attribute :direction, DIRECTIONS

    alias :aggregate_id :play_id
  end
end
