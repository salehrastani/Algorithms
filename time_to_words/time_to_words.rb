# Train of thought:
# look for a pattern among the numbers. There is a divisibility of 15 going on that requir particular changes, meaning that 15, 30, 45, 00 require written equivalants that arent the ordinary number count like one, two, three, etc. Instead they are quarter, half, and o'clock.
# Another pattern is the split of the hour in two. The first half is compared to the previous whole hour and the second half is compared to post whole hour. This calls for the use of "past" in the first half and "to" in the second half.
# Another pattern is the round tens like ten, twenty, thirty, etc., that cannot be split into two word equivalents like "twenty" and "zero", like 28 which calls for the use of "twenty" and "eight" or "thirty" and "eight" in the number 38.


def time_to_words(hour, minutes)
  hour = hour.strip
  minutes = minutes.strip
  hours = {"1"=> "one", "2"=> "two", "3"=> "three", "4"=> "four", "5"=> "five", "6"=> "six", "7"=> "seven", "8"=> "eight", "9"=> "nine", "10"=>"ten", "11"=> "eleven", "12"=> "twelve"}

  tens = {"10"=>"ten", "20"=>"twenty", "30"=>"thirty", "40"=>"fourty", "50"=>"fifty"}

  teens = {"11"=>"eleven", "12"=>"twelve", "13"=>"thirteen", "14"=>"fourteen", "15"=>"fifteen","16"=>"sixteen", "17"=>"seventeen", "18"=>"eighteen", "19"=>"nineteen"}

  preposition = {first_half: "past", second_half: "to"}

  word_version = ""

  if minutes.to_i % 60 == 0
    word_version = "#{hours[hour]} o' clock"
  elsif minutes.to_i % 30 == 0
    word_version = "half past #{hours[hour]}"
  elsif minutes.to_i < 30
    if minutes.to_i % 15 == 0
      word_version = "quarter past #{hours[hour]}"
    elsif minutes.to_i % 10 == 0
      word_version = "#{tens[minutes]} minutes past #{hours[hour]}"
    elsif minutes.to_i < 20 && minutes.to_i > 10
      word_version = "#{teens[minutes]} minutes past #{hours[hour]}"
    else
      word_version = "#{tens[minutes[0] + "0"]} #{hours[minutes[1]]} minutes past #{hours[hour]}"
    end
  else
    hour = (hour.to_i + 1).to_s
    minutes = (60 - minutes.to_i).to_s
    if minutes.to_i % 15 == 0
      word_version = "quarter to #{hours[hour]}"
    elsif minutes.to_i % 10 == 0
      word_version = "#{tens[minutes]} minutes to #{hours[hour]}"
    elsif minutes.to_i < 20 && minutes.to_i > 10
      word_version = "#{teens[minutes]} minutes to #{hours[hour]}"
    else
      if minutes.to_i < 10
        word_version = "#{hours[minutes]} minutes to #{hours[hour]}"
      else
      word_version = "#{tens[minutes[0] + "0"]} #{hours[minutes[1]]} minutes to #{hours[hour]}"
      end
    end
  end
  word_version
end

hour = gets
minutes = gets
print time_to_words(hour, minutes)
