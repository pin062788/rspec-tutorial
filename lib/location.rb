class Location
	R = 3_959

	attr_accessor :latitude, :longitude

	def initialize(args = {})
		self.latitude   = args[:latitude]
		self.longitude = args[:longitude]
	end

	def latitude
		38.123456
	end

	def longitude
		-77.444444
	end

	def near?(lat, long, radius)
    raise ArgumentError unless radius >= 0

		to_radians = Proc.new { |d| d * Math::PI / 180 }
    dist_lat = to_radians.call(lat - self.latitude)
    dist_long = to_radians.call(long - self.longitude)
         lat1 = to_radians.call(self.latitude)
         lat2 = to_radians.call(lat)
    a = Math.sin(dist_lat/2) * Math.sin(dist_lat/2) +
     Math.sin(dist_long/2) * Math.sin(dist_long/2) *
     Math.cos(lat1) * Math.cos(lat2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    (R * c) <= radius
	end

end
