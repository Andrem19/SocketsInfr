CC=g++
CFLAGS=-g
TARGET:testapp.exe
LIBS=-lpthread
OBJS=TcpClientDbManager.o \
		TcpClientServiceManager.o \
		TcpNewConnectionAcceptor.o \
		TcpServerController.o \
		network_utils.o \
		TcpClient.o \
		ByteCircularBuffer.o

testapp.exe:testapp.o ${OBJS}
	${CC} ${CFLAGS} ${OBJS} testapp.o -o testapp.exe ${LIBS}

testapp.o:testapp.cpp
	${CC} ${CFLAGS} -c testapp.cpp -o testapp.o

TcpClientDbManager.o:TcpClientDbManager.cpp
	${CC} ${CFLAGS} -c TcpClientDbManager.cpp -o TcpClientDbManager.o

TcpClientServiceManager.o:TcpClientServiceManager.cpp
	${CC} ${CFLAGS} -c TcpClientServiceManager.cpp -o TcpClientServiceManager.o

TcpNewConnectionAcceptor.o:TcpNewConnectionAcceptor.cpp
	${CC} ${CFLAGS} -c TcpNewConnectionAcceptor.cpp -o TcpNewConnectionAcceptor.o

TcpServerController.o:TcpServerController.cpp
	${CC} ${CFLAGS} -c TcpServerController.cpp -o TcpServerController.o

network_utils.o:network_utils.cpp
	${CC} ${CFLAGS} -c network_utils.cpp -o network_utils.o

TcpClient.o:TcpClient.cpp
	${CC} ${CFLAGS} -c TcpClient.cpp -o TcpClient.o

ByteCircularBuffer.o:ByteCircularBuffer.cpp
	${CC} ${CFLAGS} -c ByteCircularBuffer.cpp -o ByteCircularBuffer.o

clean:
	rm -f *.o
	rm -f *exe