# 12days.rb: Class to print out the song "The Twelve Days of Christmas."
#
# Dot pattern from TDD:
#
# SSSSSSE
# SSS.SSS
# FSSSSS.
# .SSSSSF
# SS.SSS.
# SSF.S.S
# SSSS..E
# .SES.SS
# .SS..SS
# SS..F.S
# .S.S.S.
# ...SF.S
# E..S..S
# ...S.S.
# E..E.SS
# E..SSE.
# SS.....
# F..S...
# .S.....
# ...E...
# F......
# .......


class Xmas

  ORDINALS = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

  DAY_ONE = "a partridge in a pear tree"

  GIFTS = ["and a partridge in a pear tree",
            "two turtle doves",
            "three french hens",
            "four calling birds",
            "FIVE GOLDEN RINGS",
            "six geese-a-laying",
            "seven swans-a-swimming",
            "eight maids-a-milking",
            "nine ladies dancing",
            "ten lords-a-leaping",
            "eleven pipers piping",
            "twelve drummers drumming"]

  # Return the array of gifts given a day. Days are numbered 0-11, not 1-12 as
  # in the song. The highest-numbering gift is returned first.

  def self.gifts(day)

    if day == 0

      return [DAY_ONE]    # Special case lacking "and" before "a partridge in a pear tree"

    elsif day < 12

      gifts = []

      counter = day

      while counter >= 0

        gifts << GIFTS[counter]
        counter -= 1

      end

      return gifts

    else

      return ["ERROR: DAY OUT OF RANGE"]

    end

  end

  # Sing the intro to the song with ordinal number given day. Days are numbered
  # 0-11, not 1-12.

  def self.sing_intro (day)
    return "On the #{ORDINALS[day]} day of Christmas my true love gave to me"
  end

  # Return a full verse of the song given the day.

  def self.verse(day)

    verse = self.sing_intro(day)

    if day == 0

      verse = verse + "\n" + DAY_ONE

    elsif day < 12

      counter = day

      while counter >= 0

        verse = verse + "\n" + GIFTS[counter]
        counter -= 1

      end
    else

      verse = verse + "ERROR: DAY OUT OF RANGE"

    end

    return verse

  end

  # Return the whole song.

  def self.sing

    song = ""

    counter = 0

    while counter < 12

      song = song + self.verse(counter)

      if counter != 11

        song = song + "\n\n"

      end

      counter += 1

    end

    return song

  end

end
