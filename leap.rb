# Code to refactor to be readable

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        return true
      end
      return false
    end
    return true
  end
end

# This code in my mind should work for test:

# it "Check century which is not a leap year" do
#
#   expect(leap_year?(1900)).wont_equal true
# end
#
# How ever code in lines 30 - 32 do not pass.


def leap_year?(year)
  if year % 4 == 0
    return true
  end

  if year % 100 == 0
    return false
  end

  unless year % 400 == 0
    return true
  end
end



leap_year_1 = leap_year?(1996)
leap_year_2 = leap_year?(1997)
leap_year_3 = leap_year?(1998)
leap_year_4 = leap_year?(1900)
leap_year_5 = leap_year?(2400)
leap_year_6 = leap_year?(2000)
leap_year_7 = leap_year?(8)
