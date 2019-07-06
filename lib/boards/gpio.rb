require "rpi_gpio"
module Boards
  module GPIO
    def self.gpio
      RPi::GPIO
    end
  end
end
