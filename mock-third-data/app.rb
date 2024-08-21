require 'sinatra'
require 'net/http'
require 'json'

# Menentukan port aplikasi Sinatra
set :port, 4300

get '/' do
  'just a Mock server for third party data'
end
post '/verify_identity' do
  # Mengambil data JSON dari permintaan
  request_payload = JSON.parse(request.body.read)
  p "Log saved: #{request_payload} at #{Time.now}"
  
  response = JSON.generate({status_code: 200, error_message: 'success', 
    content: {NIK: true, NAME: true, TANGGAL_LAHIR: true, KOTA_LAHIR: true}})

  # Mengembalikan respons dari Dukcapil
  content_type :json
  response.body
end
# Menjalankan aplikasi Sinatra
# run Sinatra::Application
