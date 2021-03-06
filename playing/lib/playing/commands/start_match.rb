module Types
  include Dry.Types()
end

module Playing
  class StartMatch < Dry::Struct
    attribute :play_id, Types::UUID
    attribute :game_session_id, Types::UUID
    attribute :player_one, Types::UUID
    attribute :player_two, Types::UUID
    attribute :width, Types::FIELD_SIZE
    attribute :height, Types::FIELD_SIZE

    alias :aggregate_id :play_id

  end
end
