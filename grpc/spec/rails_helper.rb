# frozen_string_literal: true

require "combustion"

begin
  Combustion.initialize! :action_controller do
    config.log_level = :fatal if ENV["LOG"].to_s.empty?
    config.i18n.available_locales = %i[en]
    config.i18n.default_locale = :en
  end
rescue => e
  # Fail fast if application couldn't be loaded
  warn "💥 Failed to load the app: #{e.message}\n#{e.backtrace.join("\n")}"
  exit(1)
end

# Monkey patch Gruf::Server to remove QUIT from KILL_SIGNALS for windows compatibility
if Gem.win_platform?
  warn "[⚠️] Windows platform detected, monkey patching Gruf::Server to remove QUIT from KILL_SIGNALS"
  module Gruf
    class Server
      remove_const(:KILL_SIGNALS) if const_defined?(:KILL_SIGNALS)
      KILL_SIGNALS = %w[INT TERM].freeze
    end
  end
end
