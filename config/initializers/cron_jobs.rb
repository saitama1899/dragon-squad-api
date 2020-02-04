# frozen_string_literal: true

require 'rufus-scheduler'
require 'be_a_dragon'

scheduler = Rufus::Scheduler.new
motivation = BeADragon::MotivateMePls

scheduler.cron '30 * * * *' do
  motivation.random_sentence('Eric')
end

# Clears Rooms on fire (visited on last hour)
scheduler.cron '0 * * * *' do
  Room.onfire.each do |room|
    room.irrelevant!
  end
end
