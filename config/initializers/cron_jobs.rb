# frozen_string_literal: true

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '30 * * * *' do
  BeADragon::MotivateMePls.random_sentence('Eric')
end

# Clears Rooms on fire (visited on last hour)
scheduler.cron '0 * * * *' do
  Room.onfire.each do |room|
    room.irrelevant!
  end
end
