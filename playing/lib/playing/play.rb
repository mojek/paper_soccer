require_relative 'field_position'

module Playing
  class Play
    include AggregateRoot
    MatchNotStartedYet = Class.new(StandardError)
    LinePositionIsAlreadyTaken = Class.new(StandardError)

    def initialize(id)

      @id = id
      @ball_position = FieldPosition.new(x: 0, y: 0)
      @lines = []
    end

    def start_match(width:, height:, player_one:, player_two:)
      @width = width
      @height = height
      @player_one = player_one
      @player_two = player_two

      apply MatchStarted.new(data: { play_id: @id, player_one: @player_one, player_two: @player_two })
    end

    def add_line(player:, direction:)
      raise MatchNotStartedYet unless @state.equal?(:started)
      raise LinePositionIsAlreadyTaken if line_position_already_taken?(direction)

      apply LineAdded.new(data: { play_id: @id, player: player, direction: direction })
      apply PlayerChanged.new(data: { play_id: @id, changed_to_player: next_player })
    end

    on MatchStarted do |event|
      @state = :started
      @current_player = event.data[:player_one]
    end

    on LineAdded do |event|
      @lines << new_line(event.data[:direction])
      @ball_position = @ball_position.add_direction(event.data[:direction])
    end

    on PlayerChanged do |event|
      @current_player = event.data[:changed_to_player]
    end

    private

    def line_position_already_taken?(direction)
      line_to_add = new_line(direction)
      @lines.include?(line_to_add)
    end

    def new_line(direction)
      direction = Direction.new(name: direction)
      new_ball_position = @ball_position.add_direction(direction)
      Line.new(@ball_position, new_ball_position)
    end

    def next_player
      @current_player == @player_one ? @player_two : @player_one
    end
  end
end
