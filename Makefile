CC = cc
CFLAGS = -Wall -Wextra -ggdb -o
OBJECT = termux-nerd-install
SRC = $(wildcard src/*)
LIBS = -lcurl -lm
PREFIX ?= $(HOME)/.local
INSTALLATION_PATH = $(PREFIX)/bin

default: $(SRC)
	$(CC) $(CFLAGS) $(OBJECT) $(SRC) $(LIBS)

clean:
	rm -f $(OBJECT)

install: default | $(INSTALLATION_PATH)
	cp $(OBJECT) $(INSTALLATION_PATH)/

$(INSTALLATION_PATH):
	mkdir -p $(INSTALLATION_PATH)

uninstall:
	rm -f $(INSTALLATION_PATH)/$(OBJECT)
