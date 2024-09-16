DIRS = src

TARGET = tcScriptLauncher
SRC = $(foreach dir, $(DIRS),$(wildcard $(dir)/*.cpp))
OBJ = $(SRC:.cpp=.o)

.PHONY: all 

%.o : %.cpp
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) $< -o $@

CXXFLAGS += -Os -s -Wall -Wextra
CXXFLAGS += -march=i486 -mtune=i686 # change or comment this out on other arches
CXXFLAGS += -fno-rtti -fno-exceptions
CXXFLAGS += -ffunction-sections -fdata-sections

LDFLAGS += -Wl,-O1 -Wl,-gc-sections
LDFLAGS += -Wl,-as-needed

CXXFLAGS += $(shell fltk-config --cxxflags | sed 's@-I@-isystem @')
LDFLAGS += $(shell fltk-config --ldflags)

all: $(TARGET)

$(TARGET): $(OBJ)
	#$(CXX) -o $@ $(filter $(dir $@)%.o, $(OBJ)) $(CXXFLAGS) $(LDFLAGS)
	$(CXX) -o $@ $(OBJ) $(CXXFLAGS) $(LDFLAGS)
	#sstrip $@

clean:
	rm -f $(TARGET) $(OBJ)

#install: all
#	mkdir -p $(INSTDIR)
#	cp -a $(TARGETS) $(INSTDIR)
