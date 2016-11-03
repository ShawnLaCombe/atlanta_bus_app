module LocationsHelper

  def fetch_buses_from_api(source_url)
    http = Net::HTTP.get_response(URI.parse(source_url))
    data = http.body
    JSON.parse(data)
  end

  # Return true if bus is near
  def is_nearby?(user_lat, user_long, bus_lat, bus_long, max_distance_from_form)
    #Max distance in degrees
    max_distance = max_distance_conversion(max_distance_from_form)
    difference_latitudes = user_lat - bus_lat.to_f
    difference_longitudes = user_long - bus_long.to_f
    distance = Math.sqrt(difference_latitudes ** 2 + differences_longitudes ** 2)
    distance <= max_distance
  end

  def max_distance_conversion(selected_option)
    if selected_option == '1'
      0.01
    elsif selected_option == '2'
      0.02
    elsif selected_option == '3'
      0.05 
    else selected_option == '4'
      1.0
    end
  end   
end
