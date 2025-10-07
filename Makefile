CC = cc
CFLAGS = -Wall -Wextra -ggdb -o
OBJECT = termux-nerd-install
SRC = $(wildcard src/*)
LIBS = -lcurl -lm
INSTALLATION_PATH = /usr/local/bin


default: $(SRC)
	$(CC) $(CFLAGS) $(OBJECT) $(SRC) $(LIBS)


clean: $(OBJECT)
	rm $(OBJECT)


install: $(INSTALLATION_PATH)
	make default
	mv $(OBJECT) $(INSTALLATION_PATH)


uninstall: $(INSTALLATION_PATH)/$(OBJECT)
	rm $(INSTALLATION_PATH)/$(OBJECT)
