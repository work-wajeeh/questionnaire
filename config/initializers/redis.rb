# frozen_string_literal: true

require 'redis'
$redis = Redis.new(host: 'localhost', port: 6379, db: 11)
