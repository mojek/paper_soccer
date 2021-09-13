# frozen_string_literal: true
require_relative 'spec_helper'

RSpec.describe Playing::MatchStarted do
  def command_bus
    Rails.configuration.command_bus
  end

  def start_match_command(**kwargs)
    params = { aggregate_id: 1, user_id: 10, game_session_id: 1,
               match_id: 42, width: 8, height: 12 }
    command_bus.call(Playing::StartMatch.new(params.merge(kwargs)))
  end

  def event_store
    Rails.configuration.event_store
  end

  it 'Start Match Create Successfully' do
    start_match_command
    expect(event_store).to have_published(an_event(Playing::MatchStarted))
  end

  it 'Raise Error when FootballPitchToSmall' do
    expect { start_match_command(width: 6, height: 2) }.to raise_error(Playing::Play::FootballPitchTooSmall)
  end

  it 'Raise Error when FootballPitchOddSize' do
    expect { start_match_command(width: 11, height: 15) }.to raise_error(Playing::Play::FootballPitchOddSize)
  end
end
