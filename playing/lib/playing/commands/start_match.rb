module Types
  include Dry.Types()
end

module Playing
  class StartMatch < Dry::Struct
    attribute :aggregate_id, Types::Coercible::Integer
    attribute :game_session_id, Types::Coercible::Integer
    attribute :user_id, Types::Coercible::Integer
    attribute :width, Types::Coercible::Integer
    attribute :height, Types::Coercible::Integer
  end
end
