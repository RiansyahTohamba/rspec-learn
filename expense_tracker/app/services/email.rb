
require 'mail'
require 'dotenv/load'

class Email
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
  
    def self.send_email(to, subject, body)
      Mail.deliver do
        to to
        from 'mriansyah93@gmail.com'
        subject subject
        body body
      end
    end  
end
