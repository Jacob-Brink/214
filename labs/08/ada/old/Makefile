# Makefile for GNAT (Ada) compilation
# Thanks to Ken Hilverda!

TARGET = namer
PACKAGE = name_package

BIN = /opt/gnat/gpl/bin/
CC = $(BIN)gcc
CFLAGS = -c

$(TARGET): $(TARGET).ali $(PACKAGE).o
	$(BIN)gnatbind $(TARGET).ali
	$(BIN)gnatlink $(TARGET).ali

$(TARGET).ali: $(TARGET).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(TARGET).adb

$(PACKAGE).o: $(PACKAGE).adb $(PACKAGE).ads
	$(CC) $(CFLAGS) $(PACKAGE).adb

clean:
	/bin/rm -f $(TARGET) *~ *# *.o *.ali *.c

