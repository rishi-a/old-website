
### Plotting AOD Heatmap over Northern India Tile
#### MCD19 User Guide: https://lpdaac.usgs.gov/documents/110/MCD19_User_Guide_V6.pdf
#### Data: MODIS/Terra+Aqua MAIAC Land Aerosol Optical Depth Daily L2G 1 km
#### Author: sustainability-lab.github.io || IIT Gandhinagar


```python
# Each tile covers 1200*1200 KM. Read User Guide For More Information
```


```python
from pyhdf import SD
import numpy as np


```


```python
from mpl_toolkits.basemap import Basemap, cm
import matplotlib.pyplot as plt
import sys
```


```python
#This uses the file "fileList.txt", containing the list of files, in order to read the files
try:
    fileList=open('fileList.txt','r')
except:
    print('Did not find a text file containing file names (perhaps name does not match)')
    sys.exit()
```


```python
# A HDF file covering the tile corresponnding to northern India
FILE_NAME = 'MCD19A2.A2019333.h24v06.006.2019335032817.hdf'
#Open the file
hdf=SD.SD(FILE_NAME)
#Read the subdatasets
#extract the list of SDS in the hdf4 file
datasets=hdf.datasets()
#Print the list
for i,v in enumerate(datasets):
    print('{0}. {1}'.format(i+1,v))
```

    1. Optical_Depth_047
    2. Optical_Depth_055
    3. AOD_Uncertainty
    4. FineModeFraction
    5. Column_WV
    6. AOD_QA
    7. AOD_MODEL
    8. Injection_Height
    9. cosSZA
    10. cosVZA
    11. RelAZ
    12. Scattering_Angle
    13. Glint_Angle
    


```python
# The Corresponding Lat/Long of the file
FILE_NAME2 = 'MAIACLatlon.h24v06.hdf'
#Open the file
hdf2=SD.SD(FILE_NAME2)
#Read the subdatasets
#extract the list of SDS in the hdf4 file
datasets2=hdf2.datasets()
#Print the list
for i,v in enumerate(datasets2):
    print('{0}. {1}'.format(i+1,v))
```

    1. lat
    2. lon
    


```python
#Lets do some operation on the lat/long file
#Source: https://portal.nccs.nasa.gov/datashare/maiac/DataRelease/MODISTile_lat-lon/
# Get lat and lon info
lat = hdf2.select('lat')
latitude = lat[:,:]
min_lat=latitude.min()
max_lat=latitude.max()
lon = hdf2.select('lon')
longitude = lon[:,:]
min_lon=longitude.min()
max_lon=longitude.max()

#is this central longitude for sinusodial projection ?
lon_c = (min_lon+max_lon)/2
```


```python
#get SDS, or exit program if SDS is not in the file
SDS_NAME = 'Optical_Depth_047'
sds=hdf.select(SDS_NAME)
attributes=sds.attributes()
scale_factor=attributes['scale_factor']


```


```python
#get valid range for AOD SDS
range=sds.getrange()
min_range=min(range)
max_range=max(range)
#get SDS data
data=sds.get()
#get data within valid range
valid_data=data.ravel()
valid_data=[x for x in valid_data if x>=min_range]
valid_data=[x for x in valid_data if x<=max_range]
valid_data=np.asarray(valid_data)
#scale the valid data
valid_data=valid_data*scale_factor
#find the average
average=sum(valid_data)/len(valid_data)
#find the standard deviation
stdev=np.std(valid_data)
#print information
print('\nThe valid range of values is: ',round(min_range*scale_factor,3), ' to ',round(max_range*scale_factor,3),'\nThe average is: ',round(average,3),'\nThe standard deviation is: ',round(stdev,3))
print('The range of latitude in this file is: ',min_lat,' to ',max_lat, 'degrees \nThe range of longitude in this file is: ',min_lon, ' to ',max_lon,' degrees')
```

    
    The valid range of values is:  -0.1  to  5.0 
    The average is:  0.669 
    The standard deviation is:  0.447
    The range of latitude in this file is:  20.004168  to  29.995832 degrees 
    The range of longitude in this file is:  63.856792  to  80.82083  degrees
    


```python
attrs = sds.attributes(full=1)
fillvalue=attrs['_FillValue']
# fillvalue[0] is the attribute value (-9999)
fv = fillvalue[0]
#turn fillvalues to NaN
data=data.astype(float)
data[data == fv] = np.nan
```




    "\n#create the map\ndata = np.ma.masked_array(data, np.isnan(data))\nm = Basemap(projection='cyl', resolution='l', llcrnrlat=min_lat, urcrnrlat = max_lat, llcrnrlon=min_lon, urcrnrlon = max_lon)\nm.drawcoastlines(linewidth=0.5)\nm.drawparallels(np.arange(-90., 120., 5.), labels=[1, 0, 0, 0])\nm.drawmeridians(np.arange(-180., 181., 5.), labels=[0, 0, 0, 1])\nx, y = m(longitude, latitude)\nm.pcolormesh(x, y, data*scale_factor, cmap=plt.cm.jet)\nplt.autoscale()\n#create colorbar\ncb = m.colorbar()\n#label colorboar\ncb.set_label('AOD')\n\n#title the plot\nplotTitle=FILE_NAME[:-4]\nplt.title('{0}\n {1}'.format(plotTitle, SDS_NAME))\nfig = plt.gcf()\n# Show the plot window.\nplt.show()\n"




```python
data = np.ma.masked_array(data, np.isnan(data))
m = Basemap(projection='cyl', resolution='l', llcrnrlat=min_lat, urcrnrlat = max_lat, llcrnrlon=min_lon, urcrnrlon = max_lon)
m.drawcoastlines(linewidth=0.5)
m.drawparallels(np.arange(-90., 120., 5.), labels=[1, 0, 0, 0])
m.drawmeridians(np.arange(-180., 181., 5.), labels=[0, 0, 0, 1])
x, y = m(longitude, latitude)
m.pcolormesh(x, y, data[0]*scale_factor, cmap=plt.cm.jet)
plt.autoscale()
#create colorbar
cb = m.colorbar()
#label colorboar
cb.set_label('AOD')

#title the plot
plotTitle=FILE_NAME[:-4]
plt.title('{0}\n {1}'.format(plotTitle, SDS_NAME))
fig = plt.gcf()
# Show the plot window.
plt.show()
```


![png](output_11_0.png)

