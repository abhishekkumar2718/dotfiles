import os

print("This script works only in present working directory!")

list = os.listdir()

for var in list:
	if var[-3:] ==  "m4a":
		os.system("""
				ffmpeg -f "%s" "%s.mp3"
			  """	% (var, var[:-3]) )	

		os.system("""
			  	rm "%s"	
			  """ % (var, ) )
