# frozen_string_literal: true

require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '* * * * *' do
  BeADragon::MotivateMePls.random_sentence('Eric')
end
