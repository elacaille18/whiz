Rails.configuration.stripe = {
  publishable_key:ENV['STRIPE_CONNECT_PUBLISHABLE_KEY'],
  secret_key:ENV['STRIPE_CONNECT_SECRET_KEY']
}
Stripe.api_key =Rails.configuration.stripe[:secret_key]
