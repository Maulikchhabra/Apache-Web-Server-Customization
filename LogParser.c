#include <stdio.h>
int main()
{

/* Declaring necessary variables:
str  used to store current character
date  used to store the date and time of the current line of file being read
statusCode  used to store the status code of the current line of file being read
i, j  iterators for the arrays date[] and statusCode[] respectively
spacecount  to keep a track of different fields of the log file.
file, file2, file3  pointers to the files access.log, simpleAccessLog.txt and simpleErrorLog.txt respectively. */

	char str;
	char date[30];
	char statusCode[3];
	int i=0,j=0;
	int spacecount=0;
	FILE * file = fopen("access.log", "r");
	FILE * file2 = fopen("simpleAccessLog.txt", "w");
	FILE * file3 = fopen("simpleErrorLog.txt", "w");

/* Traversing through file
Variable str is used to store the current character of the file
The variable spacecount is increased whenever a space appears in a line.  */

	while(str!=EOF){
		str = fgetc(file);
 		if(str==' '){
			spacecount++;
    			continue;
      		}
 /* Occurrence of new line character in the source file implies that the current log has ended. Thus, the spacecount is reset to zero.  */

      		if(str=='\n')
      		{
      			spacecount=0;
      			fputc(str, file2);
      			continue;
      		}

  /* Depending upon the value of the spacecount variable, desired fields are placed in the desired files.  */

      		if(spacecount==2)
      		{
      			fputc(str, file2);
      			continue;
      		}
      		if(spacecount==3)
      		{	
      			if(str!='[')
      			{
      				date[i] = str;
      				i++;
      			}
      		}
      		if(spacecount==4)
      		{
      			fputs("\t\t", file2);
      			spacecount++;
      			continue;
      		}
      		if(spacecount==7)
      			fputc(str, file2);
      		if(spacecount==9)
      		{
      			statusCode[j]=str;
      			j++;
		}
		if(spacecount==10)
		{
			if(statusCode[0]=='4')
			{
				for(int k=0;k<i;k++)
					fputc(date[k], file3);
				fputs("\t\t", file3);
				for(int k=0;k<j;k++)
					fputc(statusCode[k], file3);
				fputc('\n', file3);
			}
			i=0;
			j=0;
		}
	}

 /* The opened files are closed in the end.  */

	fclose(file);
	fclose(file2);
	fclose(file3);


               return 0;
}
