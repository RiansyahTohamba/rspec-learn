ENV['RACK_ENV'] = 'test'
RSpec.configure do |config|
    config.example_status_persistence_file_path = 'spec/examples.txt'
    config.filter_run_when_matching(focus: true)
end
