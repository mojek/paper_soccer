require_relative 'spec_helper'

describe Playing::LineAdded do
  def command_bus
    Rails.configuration.command_bus
  end

  def event_store
    Rails.configuration.event_store
  end

  def add_line_command(**kwargs)
    play_id = SecureRandom.uuid
    user_id = SecureRandom.uuid
    params = { play_id: play_id, user_id: user_id, direction: 'N' }
    command_bus.call(Playing::AddLine.new(params.merge(kwargs)))
  end

  context 'add add line successfully' do
    before do
      add_line_command
    end
    it 'add line successfully' do
      expect(event_store).to have_published(an_event(Playing::LineAdded))
    end
    it 'change ball positions' # read model

    it 'switch player after line added' do
      expect(event_store).to have_published(an_event(Playing::PlayerChanged))
    end

  end

  it 'raise error when line in the same place exists'
  it 'raise error when user add line when it is not his turn'

  context 'multiple lines added' do
    it 'can added next line when ball can bounce'
  end
end
