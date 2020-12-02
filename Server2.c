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
