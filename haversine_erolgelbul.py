import math
#import libraries

class Haversine_Gelbul:
   
    def __init__(self,location1,location2):
        
        long1,lat1 = location1
        long2,lat2 = location2
        #coordinates of both of the locations are inserted either
        #as a tuple or as a list
        
        R = 6362000
        #the radius of Earth calculated using Chapter 2.1.6 where
        #the latitude of both airports were averaged to achieve a
        #more practical radius
        
        radlat1 = math.radians(lat1)
        radlat2 = math.radians(lat2)
        #converting the values to radians, again, this is not a
        #necessity, although we will be using radians all the time
        #for consistency

        delta_radlat=math.radians(lat2-lat1)
        delta_radlong=math.radians(long2-long1)
        #calculating the difference of both the values, starting from
        #the second value for each location and substracting the first


        h=math.sin(delta_radlat/2.0)**2+\
           math.cos(radlat1)*math.cos(radlat2)*\
           math.sin(delta_radlong/2.0)**2
        #calculating haversines central angle value: h

        if h>1 or h<0:
            print("h value is going to result in a floating point error")
        #this is a precaution if the points are antipodal or near antipodal
        #in other words might result in a floating point error
        
        c=2*math.atan2(math.sqrt(h),math.sqrt(1-h))
        #calculate haversine distance

        self.meters=R*c 
        self.km=self.meters/1000.0      
        #output result in kilometers

if __name__ == "__Haversine_Gelbul__":
    main()


#Haversine_Gelbul((-0.5,47),(-14,52)).km
