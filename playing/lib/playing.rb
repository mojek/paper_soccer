require_relative 'playing/commands/start_match'
require_relative 'playing/events/match_started'


module Playing
  class OnStartMatch
    include CommandHandler
    def call(command)
      with_aggregate(Play, command.aggregate_id) do |play|
        play.start_match(width: command.width, height: command.height)
      end
    end
  end
end
