Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.httponly = true
  config.secure_cookie = true
  config.signed_cookie = true
  config.rotate_csrf_on_sign_in = true
end
