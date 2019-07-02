class Bottles
  def song
    verses(99,0)
  end

  def verses(n, m)
    n.downto(m).reduce("") do |accm, e|
      if accm != ""
        accm += "\n"
      end
      accm += verse(e)
    end
  end
    
  def verse(n)
    r = first_phrase(n)
    r += second_phrase(n)
    r += third_phrase(n)
    r += forth_phrase(n)
  end

  def how_many_bottles_of_beer(n)
    suffix = " of beer"
    if n > 1
      "#{n} bottles" + suffix
    elsif n == 1
      "#{n} bottle" + suffix
    elsif n == 0
      "no more bottles" + suffix
    elsif n == -1
      "99 bottles" + suffix
    end
  end

  def first_phrase(n)
    "#{how_many_bottles_of_beer(n).capitalize} on the wall, "
  end

  def second_phrase(n)
    "#{how_many_bottles_of_beer(n)}.\n"
  end

  def third_phrase(n)
    if n == 0
      "Go to the store and buy some more, "
    else
      "Take #{n == 1 ? 'it' : 'one'} down and pass it around, "
    end
  end

  def forth_phrase(n)
    "#{how_many_bottles_of_beer(n-1)} on the wall.\n"
  end
end
