# module Types
#   include Dry.Types()
# end

module Playing
  class Direction < Dry::Struct
    attribute :name, Types::DIRECTIONS

    def to_s
      name
    end
  end
end
