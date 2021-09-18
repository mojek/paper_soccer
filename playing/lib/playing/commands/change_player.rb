module Types
  include Dry.Types()
end

module Playing
  class ChangePlayer < Dry::Struct
    attribute :aggregate_id, Types::Coercible::Integer
    attribute :user_id, Types::Coercible::Integer
  end
end
