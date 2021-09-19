module Types
  include Dry.Types()
end

module Playing
  class AddLine < Dry::Struct
    attribute :play_id, Types::UUID
    attribute :player, Types::UUID
    attribute :direction, Types::DIRECTIONS

    alias :aggregate_id :play_id
  end
end
