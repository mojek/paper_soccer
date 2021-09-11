# frozen_string_literal: true

module Playing
  class Play
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def start_match(width:, height:)
      apply MatchStarted.new(data: { play_id: @id })
    end

    on MatchStarted do |event|
      @state = :started
    end
  end
end
