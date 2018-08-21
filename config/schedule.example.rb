# frozen_string_literal: true

job_type :ruby, 'cd :path && bundle exec ruby :task :output'

env :PATH, ENV['PATH']

set :chronic_options, hours24: true
set :output,
    standard: 'log/stdout.log',
    error:    'log/stderr.log'

every 1.day, at: '9:10' do
  ruby 'gdax_dca.rb'
end
