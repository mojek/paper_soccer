require_relative 'spec_helper'

describe Playing::LineAdded do
  let(:play_id) { SecureRandom.uuid }
  let(:player_one) { SecureRandom.uuid }
  let(:player_two) { SecureRandom.uuid }

  def command_bus
    Rails.configuration.command_bus
  end

  def event_store
    Rails.configuration.event_store
  end

  def start_match(play_id, player_one, player_two)
    params = { play_id: play_id,
               player_one: player_one, player_two: player_two,
               game_session_id: SecureRandom.uuid,
               width: 8, height: 12 }
    command_bus.call(Playing::StartMatch.new(params))
  end

  def add_line_command(**kwargs)
    play_id = SecureRandom.uuid
    user_id = SecureRandom.uuid
    params = { play_id: play_id, player: user_id, direction: 'N' }
    command_bus.call(Playing::AddLine.new(params.merge(kwargs)))
  end

  context 'add add line successfully' do
    before do
      start_match(play_id, player_one, player_two)
      add_line_command(play_id: play_id, player: player_one)
    end
    it 'add line successfully' do
      expect(event_store).to have_published(an_event(Playing::LineAdded))
    end
    it 'change ball positions' # read model

    it 'switch player after line added' do
      expect(event_store).to have_published(an_event(Playing::PlayerChanged))
    end
  end
  context 'before match is started' do
    it 'can not add a line ' do
      expect { add_line_command(direction: 'S') }.to raise_error(Playing::Play::MatchNotStartedYet)
    end
  end

  it 'raise error when line in the same place exists' do
    start_match(play_id, player_one, player_two)
    add_line_command(play_id: play_id, player: player_one, direction: 'N')
    expect do
      add_line_command(play_id: play_id, player: player_two, direction: 'S')
    end.to raise_error(Playing::Play::LinePositionIsAlreadyTaken)
  end

  it 'raise error when user add line when it is not his turn'

  context 'multiple lines added' do
    it 'can added next line when ball can bounce'
  end
end
