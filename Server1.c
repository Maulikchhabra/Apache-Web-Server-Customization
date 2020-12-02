#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h> //header files for socket prog

#include <netdb.h>
#include <arpa/inet.h>
#include <err.h>
 
//Storing the response webpage in a character array.
//This webpage will be displayed when client visits the server. 

char response[] = "HTTP/1.1 200 OK\r\n"
"Content-Type: text/html; charset=UTF-8\r\n\r\n"
"<!DOCTYPE html><html><head><title>Server1</title>"
"<style>body { background-color: #111 }"
"h1 { font-size:4cm; text-align: center; color: black;"
" text-shadow: 0 0 2mm red}</style></head>"
"<body><h1>Hello world!</h1></body></html>\r\n";
 
int main()
{
  int one = 1, client_fd;
  struct sockaddr_in svr_addr, cli_addr;
  socklen_t sin_len = sizeof(cli_addr);
  
  int sock =socket(AF_INET, SOCK_STREAM,0);
 
  if (sock < 0)
    err(1, "can't open socket");
 
  setsockopt(sock,SOL_SOCKET, SO_REUSEADDR, &one, sizeof(int));
 
  int port = 9090;
 
  svr_addr.sin_family = AF_INET; //to use IP address or we can say you will be having all values in IP address  
  svr_addr.sin_addr.s_addr = INADDR_ANY; //you get your address by your own (this pc address only)
  svr_addr.sin_port = htons(port); //htons() method convert port number from int to network format
 
  if (bind(sock,(struct sockaddr *) &svr_addr, sizeof(svr_addr)) == -1) {
    close(sock);
    err(1, "Can't bind");
  }
 
  listen(sock, 5);
 
  while (1) {
    client_fd = accept(sock, (struct sockaddr *) &cli_addr, &sin_len); //accept the request
    printf("got connection\n");
 
    if (client_fd == -1) { 
      perror("Can't accept"); //error on accepting the request
      continue;
    }
 
    write(client_fd, response, sizeof(response) - 1); //write the given thing {or message} on the server so if client access it he can see the msg
    close(client_fd); //close the connection
  }
  
}
