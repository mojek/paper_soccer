require_relative 'spec_helper'

RSpec.describe Playing::MatchStarted do
  def command_bus
    Rails.configuration.command_bus
  end

  def start_match_command(**kwargs)
    play_id = SecureRandom.uuid
    user_id = SecureRandom.uuid
    game_session_id = SecureRandom.uuid
    params = { play_id: play_id, user_id: user_id, game_session_id: game_session_id, width: 8, height: 12 }
    command_bus.call(Playing::StartMatch.new(params.merge(kwargs)))
  end

  def event_store
    Rails.configuration.event_store
  end

  it 'Start Match Create Successfully' do
    start_match_command
    expect(event_store).to have_published(an_event(Playing::MatchStarted))
  end


end
