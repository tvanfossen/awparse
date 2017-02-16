#include <stdio.h>
#include <stdlib.h>
#include "file_utils.h"
int read_files(char * filename, char ** buffer)
{
	FILE * pFile = fopen (filename, "r"); //Opens designated file for reading
	int i =0;
	char c;
	*buffer = malloc (1000*sizeof(char));

	if (pFile == NULL)
	{
		fprintf (stderr, "ERROR: FILE NOT FOUND");
	}
	else 
	{
		do
		{
			c = fgetc (pFile);//Reads in character by character
			if (c != EOF) *(*buffer+i) = c; //Assuming character is not end of file, the character is added to the buffer original called by the function. 
			i++;
		}
		while (c!=EOF);
		fclose(pFile);
	}
	return i;
}

int write_files(char * filename, char * buffer, int size)
{
	FILE * pFile = fopen (filename, "w"); 
	for (int i  = 0;i>=size;i--)
	{
		fputc(*(buffer+i), pFile);
	}
	fclose(pFile);
	return 0;
}
