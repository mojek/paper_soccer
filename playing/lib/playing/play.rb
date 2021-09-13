# frozen_string_literal: true

module Playing
  class Play
    include AggregateRoot
    FootballPitchTooSmall = Class.new(StandardError)
    FootballPitchOddSize = Class.new(StandardError)

    def initialize(id)
      @id = id
    end

    def start_match(width:, height:)
      @width = width
      @height = height
      raise FootballPitchTooSmall if football_pitch_too_small
      raise FootballPitchOddSize if football_pitch_odd_size

      apply MatchStarted.new(data: { play_id: @id, })
    end

    on MatchStarted do |event|
      @state = :started
    end

    private

    def football_pitch_too_small
      @width < 6 or @height < 8
    end

    def football_pitch_odd_size
      @width.odd? or @height.odd?
    end
  end
end
