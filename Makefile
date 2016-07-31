# single_chan_pkt_fwd
# Single Channel LoRaWAN Gateway

CC=g++
CFLAGS=-c -Wall
LIBS=-lwiringPi
INCLUDES=-I/usr/local/lib


all: loragw

loragw: base64.o main.o utilities.o aes.o cmac.o LoRaMacCrypto.o
	$(CC) main.o base64.o utilities.o aes.o cmac.o LoRaMacCrypto.o $(LIBS) -o loragw

main.o: main.c
	$(CC) $(CFLAGS) main.c

base64.o: base64.c
	$(CC) $(CFLAGS) base64.c

utilities.o: utilities.c
	$(CC) $(CFLAGS) utilities.c

aes.o: aes.c
	$(CC) $(CFLAGS) aes.c

cmac.o: cmac.c
	$(CC) $(CFLAGS) cmac.c

LoRaMacCrypto.o: LoRaMacCrypto.c
	$(CC) $(CFLAGS) LoRaMacCrypto.c
clean:
	rm *.o loragw
