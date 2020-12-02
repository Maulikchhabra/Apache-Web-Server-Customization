//Random Access log Generator

#include<stdio.h>
#include<stdlib.h>

//min + rand()%(max-min+1)
int main()
{
	FILE * p = fopen("access.log", "w");
	int i;
	char ip[12][19] = {"127.0.0.1","127.0.0.2","127.0.0.3","127.0.0.4","127.0.0.5","192.1.2.3","192.2.1.3","192.0.1.1","192.0.0.3","192.1.2.3","172.1.1.0","172.2.1.1"};
	char name[12][15] = {"Dev","Arisha","Riya","Riddhi","-","Priya","Khyati","Vijay","Kusum","Ajay","Veena","Divya"};
	char time[5][25] = {"10/Oct/2020:13:55:36","15/Nov/2020:15:25:19","03/May/2021:12:05:06","31/Dec/2020:17:12:03","05/Jun/2021:00:00:00"};
	int zone[5] = {0530,0330,0500,0600,0630};
	char method[2][10] = {"GET","POST"};
	char file[10][15] = {"-","/phone.png","/profile.jpeg","/index.html","/hello.jsp","/login.php"};
	char protocol[3][15] = {"-","HTTP/1.0","HTTP/2.0"};
	int statusCode[10] = {400,404,200,201,203,402,403,100,150,399};
	int objectSize[5] = {2005,2010,2015,2020,2025};
	
	for(i=0;i<25;i++)
	{
		fputs(ip[rand()%12], p);
		fputs(" - ", p);
		fputs(name[rand()%12], p);
		fputs(" [", p);
		fputs(time[rand()%5], p);
		fputs(" +0", p);
		fprintf(p, "%d", zone[rand()%5]);
		fputs("] \"", p);
		fputs(method[rand()%2], p);
		fputs(" ", p);
		fputs(file[rand()%6], p);
		fputs(" ", p);
		fputs(protocol[rand()%3], p);
		fputs("\" ", p);
		fprintf(p, "%d", statusCode[rand()%10]);
		fputs(" ", p);
		fprintf(p, "%d", objectSize[rand()%5]);
		fputc('\n', p);
	}
	fclose(p);
	return 0;
}
