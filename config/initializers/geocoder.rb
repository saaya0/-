Geocoder.configure(
  lookup: :google,
  use_https: true,    
  api_key: ENV['GOOGLE_GEO_API']
)