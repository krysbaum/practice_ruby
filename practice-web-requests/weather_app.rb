require "http"
puts "Welcome to Weather.com!"

while true
  # GET CITY
  puts "Enter in your city: "
  city = gets.chomp.capitalize

  # GET DEGREE UNITS
  puts "Do you prefer [C]elcius or [F]arenheit? "
  units = gets.chomp.downcase
  degrees = "Kelvin"
  if units == "c"
    units = "metric"
    degrees = "Celcius"
  elsif units == "f"
    units = "imperial"
    degrees = "Farenheit"
  else
    puts "You didn't select Celcius or Farenheit. You're now being punished with Kelvins."
    units = "standard"
  end
  # GET 1 or 5 DAY FORECAST
  puts "Do you want to see [T]oday's weather or the [F]ive-day forecast?"
  url = gets.chomp.downcase
  if url == "t"
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=#{units}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")
  else
    response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=#{city}&units=#{units}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")
  end

  data = response.parse

  if url == "t"
    temperature = data["main"]["temp"]
    humidity = data["main"]["humidity"]
    min = data["main"]["temp_min"]
    max = data["main"]["temp_max"]
    description = data["weather"][0]["description"]
    puts "Today in #{city} it is #{temperature} degrees #{degrees} outside with #{description}. \nThe min is #{min} degrees and the max is #{max} degrees. The humidity is #{humidity}%."
  elsif url == "f"
    puts "The five day forecast for #{city} is:"
    i = 0
    while i < 5
      puts "- Day #{i + 1}: #{data["list"][i]["main"]["temp"]}"
      i += 1
    end
    puts "Note: temperature is in #{degrees}"
  else
    puts "Wait... that's not a T or an F..."
  end

  puts "\nWould you like to select a new city? Y / N: "
  input = gets.chomp.downcase
  if input == "n"
    puts "Have a nice day!"
    break
  end
end
