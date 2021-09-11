# frozen_string_literal: true
require_relative 'spec_helper'

RSpec.describe Playing::MatchStarted do
  def command_bus
    Rails.configuration.command_bus
  end

  def event_store
    # RubyEventStore::Client.new(repository: RubyEventStore::InMemoryRepository.new)
    # Rails.configuration.event_store
    # end
    Rails.configuration.event_store

  end

  it 'Start Match Create Successfully' do
    command_bus.call(Playing::StartMatch.new(aggregate_id: 1, user_id: 10, game_session_id: 1,
                                             match_id: 42, width: 8, height: 12))
    expect(event_store).to have_published(an_event(Playing::MatchStarted))
  end
end
