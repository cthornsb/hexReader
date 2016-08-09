#####################################################################

# Installer for hexReader
# Cory R. Thornsberry
# May 19th, 2016

#####################################################################

COMPILER = g++

CFLAGS = -Wall -O3 -Iinclude

TOP_LEVEL = $(shell pwd)
SOURCE_DIR = $(shell pwd)/source

INSTALL_DIR = ~/bin

# Main executable
MAIN_SRC = $(SOURCE_DIR)/hexReader.cpp

EXECUTABLE = hexReader

########################################################################

$(EXECUTABLE): $(MAIN_SRC)
#	Link the executable
	$(COMPILER) $(CFLAGS) $(MAIN_SRC) -o $@
	@echo " Done making "$(EXECUTABLE)

########################################################################

.PHONY: install uninstall clean

#####################################################################

install:
#	Uninstall executable to install directory.
	@echo "Installing to "$(INSTALL_DIR)
	@ln -s -f $(TOP_LEVEL)/$(EXECUTABLE) $(INSTALL_DIR)/hexReader

#####################################################################

uninstall:
#	Uninstall executable from install directory.
	@echo "Uninstalling from "$(INSTALL_DIR)
	@rm -f $(INSTALL_DIR)/hexReader

#####################################################################

clean: 
	@rm -f $(EXECUTABLE)
