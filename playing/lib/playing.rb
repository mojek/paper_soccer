require_relative 'playing/commands/start_match'
require_relative 'playing/events/match_started'

require_relative 'playing/events/line_added'
require_relative 'playing/commands/add_line'

require_relative 'playing/events/player_changed'

module Playing
  class OnStartMatch
    include CommandHandler
    def call(command)
      with_aggregate(Play, command.aggregate_id) do |play|
        play.start_match(width: command.width, height: command.height)
      end
    end
  end

  class OnAddLine
    include CommandHandler
    def call(command)
      with_aggregate(Play, command.aggregate_id) do |play|
        play.add_line(direction: command.direction, user_id: command.user_id)
      end
    end
  end
end
