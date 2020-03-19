Script started on 2020-02-21 13:56:37-0500
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ruby yaer   ear_codes.rb
Enter the year: freshman
Numeric code is: 1
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ruby year_codes.rb
Enter the year: sophomore
Numeric code is: 2
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ruby year_codes.rb
Enter the year: junior
Numeric code is: 3
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ruby year_codes.rb
Enter the year: senior
Numeric code is: 4
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ruby year_codes.rb
Enter the year: hayChong       ey  heychan
Numeric code is: 0
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ruby year_codes.rb
Enter the year: supersi enior
Numeric code is: 4
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ ruby year_codes.rb
Enter the year: ssenior
Numeric code is: 4
]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ cat year_codes.rb
#! /usr/bin/ruby
# year_codes.rb translates an academic year into a numeric code
# Begun by: Dr. Nelesen, for CS 214 at Calvin College
# Completed by: Jacob Brink
# Lab: 03
# Date: 2/21/2020
################################################################

# Input:  The name of an academic year
# Precondition: The academic year is a string with a value of freshman, 
#   sophomore, junior or senior
# Output: The corresponding integer code for the given academic year

def yearCode(year)
  if year =~ /freshman/ then
    1
  elsif year =~ /sophomore/ then
    2
  else
    if year =~ /junior/ then
      3
    elsif year =~ /senior/ then
      4
    else
      0
    end
  end
    
end


if __FILE__ == $0
   print "Enter the year: "
   year = gets
   print "Numeric code is: "
   puts yearCode(year)
end

]0;jpb34@gold25: ~/Documents/214/labs/03[01;32mjpb34@gold25[00m:[01;34m~/Documents/214/labs/03[00m$ exit

Script done on 2020-02-21 13:58:24-0500
