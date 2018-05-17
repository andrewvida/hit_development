unless ENV['DISABLE_OKTA'] == "true"
  Devise.setup do |config|
    # ==> Configuration for :saml_authenticatable

    # Create user if the user does not exist. (Default is false)
    config.saml_create_user = true

    # Update the attributes of the user after a successful login. (Default is false)
    config.saml_update_user = true

    # Set the default user key. The user will be looked up by this key. Make
    # sure that the Authentication Response includes the attribute.
    config.saml_default_user_key = :email

    # Optional. This stores the session index defined by the IDP during login.  If provided it will be used as a salt
    # for the user's session to facilitate an IDP initiated logout request.
    config.saml_session_index_key = :session_index

    # You can set this value to use Subject or SAML assertation as info to which email will be compared
    # If you don't set it then email will be extracted from SAML assertation attributes
    config.saml_use_subject = true

    # You can support multiple IdPs by setting this value to a class that implements a #settings method which takes
    # an IdP entity id as an argument and returns a hash of idp settings for the corresponding IdP.
    config.idp_settings_adapter = nil

    # You provide you own method to find the idp_entity_id in a SAML message in the case of multiple IdPs
    # by setting this to a custom reader class, or use the default.
    # config.idp_entity_id_reader = DeviseSamlAuthenticatable::DefaultIdpEntityIdReader

    # You can set a handler object that takes the response for a failed SAML request and the strategy,
    # and implements a #handle method. This method can then redirect the user, return error messages, etc.
    # config.saml_failed_callback = nil

    # Configure with your SAML settings (see [ruby-saml][] for more information).
    config.saml_configure do |settings|
      settings.soft = false
      # config = YAML.load_file("#{Rails.root}/config/devise_saml_config.yml")[Rails.env]
      # app_url = config['app_url']

      settings.assertion_consumer_service_url     = "#{ENV['HEROKU_APP_NAME']}/users/saml/auth"
      settings.assertion_consumer_service_binding = "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
      settings.name_identifier_format             = "urn:oasis:names:tc:SAML:2.0:nameid-format:transient"
      settings.issuer                             = "#{ENV['HEROKU_APP_NAME']}/users/saml/metadata"
      settings.authn_context                      = ""
      settings.idp_slo_target_url                 = "https://hendrick.okta.com"
      settings.idp_sso_target_url                 = "#{ENV['IDP_SSO_TARGET_URL']}"
      settings.idp_cert                           = <<-CERT.chomp
          -----BEGIN CERTIFICATE-----
          MIIDoDCCAoigAwIBAgIGAUtBx86iMA0GCSqGSIb3DQEBBQUAMIGQMQswCQYDVQQGEwJVUzETMBEG
          A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU
          MBIGA1UECwwLU1NPUHJvdmlkZXIxETAPBgNVBAMMCGhlbmRyaWNrMRwwGgYJKoZIhvcNAQkBFg1p
          bmZvQG9rdGEuY29tMB4XDTE1MDEzMTIwNTUyOFoXDTQ1MDEzMTIwNTYyOFowgZAxCzAJBgNVBAYT
          AlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRYwFAYDVQQHDA1TYW4gRnJhbmNpc2NvMQ0wCwYDVQQK
          DARPa3RhMRQwEgYDVQQLDAtTU09Qcm92aWRlcjERMA8GA1UEAwwIaGVuZHJpY2sxHDAaBgkqhkiG
          9w0BCQEWDWluZm9Ab2t0YS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC93c55
          M8JxEzfhputXEm2XGpii+64/Fq/jcm512BWsN1Ck9JV/N0kopSoA3WIeTgzDFaF+raAMu80BOggx
          yoT0KWQzi0q1aQzhdRK6fheIiLmkj5SjSgjXAKXKwMF142PYBnVVc+UvrzC1k+NaWAenrl3LieCt
          jjHQeTiCtEFasbxlFhQe1/T1nhjYcR5H3cZ25kr1SxhM/uqNm82o54yaavaPoaZRcL+AfmbE8RIq
          ByBDQ0d9WnKkpdZCn9F6a/IE3ZGsYSk+UrNZTZ+g/h0K1slmILTJIBEF7KICGFv1YU3EhfzDe4nt
          hClaApGoG4CUGPsqFXnnrxeXlzVldMFNAgMBAAEwDQYJKoZIhvcNAQEFBQADggEBAB9mfGWWw3F3
          LmDoMUwTZ5KHykGxpdVk2xS/YWBkg9WOQnqHWp/waOzO+FYymebB2kEEr7rRUf+/+0k4OwKEoaUM
          P3skH9bhLAMgNpC4d2uEa1nCt8eeb1rdh8LXcWdzSUpkFiirZwyJ6NXSyD+zw8xQLEli/Bh12Hox
          8q2GnTnh1dP8ef9mMlG6vymkT7m70ghy7gFrOflvsfVZdHdcqDzGHwnQTwFtjEM1ym42DuCfk7E8
          RvBjTxc549W+TxGqQUBBPzoxtHJei+ot+1uDJdJnujlTVWhk7YOaneYa1Ig5xYJS7GDFfE1dxaHK
          NaRikwoD9b8N8diMpebhkB5R00k=
          -----END CERTIFICATE-----
      CERT
    end
  end
end
