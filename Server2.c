#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <err.h>


/* Storing the response webpage in a character array.
This webpage will be displayed when client visits the server.*/
char response[] = "HTTP/1.1 200 OK\r\n"
"Content-Type: text/html; charset=UTF-8\r\n\r\n"
"<!DOCTYPE html><html><head><title>Server2</title>"
"<style>body { background-color: #111 }"
"h1 { font-size:4cm; text-align: center; color: black;"
" text-shadow: 0 0 2mm red}</style></head>"
"<body><h1>Hii, world!</h1></body></html>\r\n";


int main()
{
	/*Declaring necessary variables
	one -> to be used in the function setsockopt
	client_fd -> used to store the result of the accept method
	svr_addr -> used to store the server address
	cli_addr -> used to store the client address*/
	int one = 1, client_fd;
	struct sockaddr_in svr_addr, cli_addr;
	socklen_t sin_len = sizeof(cli_addr);
	
	/* Creation of the new socket
	The socket() function shall create an unbound socket in a communications domain, and return
	a file descriptor that can be used in later function calls that operate on sockets.
	The socket() function takes the following arguments:
	AF_INET: Specifies the communications domain in which a socket is to be created.
	SOCK_STREAM: Specifies the type of socket to be created.
	The third argument specifies a particular protocol to be used with the socket. Specifying a
	protocol of 0 causes socket() to use an unspecified default*/
	
	int sock = socket(AF_INET, SOCK_STREAM, 0);
	
	//If anything goes wrong in socket creation, the function returns -1
	if (sock < 0)
		err(1, "can't open socket");
		
	/*Setting a means to control the socket’s behavior
	The setsockopt() function shall set the option specified by the option_name argument, at the
	protocol level specified by the level argument, to the value pointed to by the option_value
	argument for the socket associated with the file descriptor specified by the socket argument .*/
	
	setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(int));
	
	/* Setting up the necessary configuration
	port -> the port on which the server will work is initialized.*/
	
	int port = 9091;
	
	svr_addr.sin_family = AF_INET; // to use IP address or we can say you will be having all values in IP address
	svr_addr.sin_addr.s_addr = INADDR_ANY; // you get your address by your own (this pc address only)
	svr_addr.sin_port = htons(port); //htons() method convert port number from int to network format
	
	/* Binding the server address to the socket
	The bind() function shall assign a local socket address address to a socket identified by
	descriptor socket that has no local socket address assigned. Sockets created with the socket()
	function are initially unnamed; they are identified only by their address family.
	The bind() function takes the following arguments:
	socket: Specifies the file descriptor of the socket to be bound.
	address: Points to a sockaddr structure containing the address to be bound to the socket. The
	length and format of the address depend on the address family of the socket.
	address_len: Specifies the length of the sockaddr structure pointed to by the address argument .
	The bind() returns -1 upon any error in binding the server address with the socket.*/
	if (bind(sock, (struct sockaddr *) &svr_addr, sizeof(svr_addr)) == -1) {
		close(sock);
		err(1, "Can't bind");
	}
