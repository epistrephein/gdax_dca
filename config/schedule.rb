env :PATH, ENV['PATH']

set :chronic_options, hours24: true
set :output,
    standard: File.join(Dir.pwd, 'log', 'orders.log'),
    error:    File.join(Dir.pwd, 'log', 'errors.log')

every 1.day, at: '9:10' do
  command "cd #{Dir.pwd} && bundle exec ruby gdax_dca.rb"
end
