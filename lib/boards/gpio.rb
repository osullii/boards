require "rpi_gpio"
module Boards
  def self.gpio
    RPi::GPIO
  end
end