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
