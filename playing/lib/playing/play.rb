# frozen_string_literal: true

module Playing
  class Play
    include AggregateRoot


    def initialize(id)
      @id = id
    end

    def start_match(width:, height:)
      @width = width
      @height = height

      apply MatchStarted.new(data: { play_id: @id, })
    end

    def add_line(user_id:, direction:)
      apply LineAdded.new(data: { play_id: @id, user_id: user_id, direction: direction })
      apply PlayerChanged.new(data: { play_id: @id, user_id: user_id })
    end

    on MatchStarted do |event|
      @state = :started
    end

    on LineAdded do |event|

    end

    on PlayerChanged do |event|

    end


  end
end
