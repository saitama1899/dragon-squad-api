# frozen_string_literal: true

require 'rufus-scheduler'
require 'be_a_dragon'

scheduler = Rufus::Scheduler.new
motivation = BeADragon::MotivateMePls

scheduler.cron '* * * * *' do
  motivation.random_sentence('Eric')
end
