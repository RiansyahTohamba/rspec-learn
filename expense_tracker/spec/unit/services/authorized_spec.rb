# frozen_string_literal: true
require 'rack/test'

RSpec.shared_context 'Auth'  do
  include Rack::Test::Methods
  before do
    basic_authorize 'riansyah','password'
  end
end
