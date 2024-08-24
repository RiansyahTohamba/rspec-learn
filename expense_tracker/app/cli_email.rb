require 'mail'
require 'dotenv/load'

if ENV['SMTP_USERNAME'].nil? || ENV['SMTP_PASSWORD'].nil?
  raise "SMTP credentials are missing!"
end

# Konfigurasi Mail
Mail.defaults do
  delivery_method :smtp, {
    address: 'smtp.gmail.com',
    port: 587,
    user_name: ENV['SMTP_USERNAME'],
    password: ENV['SMTP_PASSWORD'],
    authentication: 'plain',
    enable_starttls_auto: true
  }
end

Mail.deliver do
  to 'riansyaht93@gmail.com'
  from 'mriansyah93@gmail.com'
  subject 'judullll subject'
  body 'body goals ku mantap'
end
p "Email sent successfully!"
