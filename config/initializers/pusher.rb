# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '311726'
Pusher.key = '539a5f2700194b31fcf1'
Pusher.secret = '5021deac04587d3713ac'
Pusher.logger = Rails.logger
Pusher.encrypted = true
