require "rpi_gpio"
module Boards
  def gpio
    RPi::GPIO
  end
end
