.PHONY: all clean

CPP = g++
SWIG = swig

SW_FLAGS = -c++ -python
CPP_FLAGS = -c -fPIC

OBJECTS = imgcv.o imgcv_wrap.o

LDFLAGS = -lopencv_calib3d -lopencv_contrib -lopencv_core -lopencv_features2d -lopencv_flann \
          -lopencv_gpu -lopencv_highgui -lopencv_imgproc -lopencv_legacy -lopencv_ml -lopencv_nonfree \
          -lopencv_objdetect -lopencv_photo -lopencv_stitching -lopencv_superres -lopencv_ts \
          -lopencv_video -lopencv_videostab

SW_LDFLAGS = -lpython -dynamiclib

# Change this to where your system installs are
INCLUDES = -I'/usr/local/include/opencv' \
		   -I'/usr/local/include' \
		   -I'/usr/local/Cellar/python/2.7.10_2/Frameworks/Python.framework/Versions/2.7/include/python2.7'

# Change this to where your system installs are
LIB_INCLUDES = -L'/usr/local/lib'\
               -L'/usr/local/Cellar/python/2.7.10_2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config'

LIB_APPLE = '/System/Library/Frameworks/Python.framework/Versions/2.7/Python'
LIB_PORTS = '/usr/local/Cellar/python/2.7.10_2/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib'

all: _imgcv.so

imgcv_wrap.cxx: imgcv.i
		$(SWIG) $(SW_FLAGS) $<

imgcv_wrap.o: imgcv_wrap.cxx
		$(CPP) $(CPP_FLAGS) $(INCLUDES) $(LIB_INCLUDES) $<

imgcv.o: imgcv.cpp
		$(CPP) $(INCLUDES) $(LIB_INCLUDES) $(LDFLAGS) $(SW_LDFLAGS) $< -o $@

_imgcv.so: $(OBJECTS)
		$(CPP) $(SW_LDFLAGS) $^ -o $@


clean:
		rm -f *.o *.cxx *.pyc *.so imgcv.py

# necessary hack for python import on OSX when using Macports-python instead of Apple-python
mac_hack:
		install_name_tool -change $(LIB_APPLE) $(LIB_PORTS) _imgcv.so
