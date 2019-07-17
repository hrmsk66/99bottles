class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).collect { |n| verse(n) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)
      "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action}" +
      "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    when 6
      BottleNumber6
    else
      BottleNumber
    end.new(number)
  end

  def to_s
    "#{quantity} #{container}"
  end

  def successor
    BottleNumber.for(number-1)
  end

  def action
    "Take #{pronoun} down and pass it around, "
  end

  def quantity
    number.to_s
  end

  def pronoun(delete_me=nil)
    'one'
  end

  def container
    'bottles'
  end
end

class BottleNumber0 < BottleNumber
  def successor
    BottleNumber.for(99)
  end

  def action
      'Go to the store and buy some more, '
  end

  def quantity
      'no more'
  end
end

class BottleNumber1 < BottleNumber
  def pronoun(delete_me=nil)
    'it'
  end

  def container
    'bottle'
  end
end

class BottleNumber6 < BottleNumber
  def container
    'six-pack'
  end

  def quantity
    '1'
  end
end
