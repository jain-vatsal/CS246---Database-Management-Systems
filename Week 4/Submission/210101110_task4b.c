#include<stdio.h>
#include<string.h>
int main()
{
FILE *f1=fopen("hss_electives.csv","r");
	FILE *f2=fopen("210101110_task4b.sql","w");
	char input[2000];
	while(fgets(input,2000,f1))
	{
	char cid[10],cname[60],sname[50];
	char sno[100],roll[12];
	if(input[strlen(input)-1]=='\n')
	input[strlen(input)-1]='\0';
	char *token;
	token= strtok(input ,",");
	int j=0;
	while(token!=NULL && token!="\n")
	{
	if(j==0)
	strcpy(sno,token);
	else if(j==1)
	strcpy(roll,token);
	else if(j==2)
	strcpy(sname,token);
	else if(j==3)
	strcpy(cid,token);
	else if(j==4)
	strcpy(cname,token);
	token= strtok(NULL ,",");
	j++;
	}
	fprintf(f2,"INSERT INTO hss_table03 VALUES (%s,%s,'%s','%s','%s');\n",sno,roll,sname,cid,cname);
	}
	fclose(f1);
	FILE *f3=fopen("additional_hss_course.csv","r");
	while(fgets(input,2000,f3))
	{
	char cid[10],cname[60],sname[50];
	char sno[100],roll[12];
	if(input[strlen(input)-1]=='\n')
	input[strlen(input)-1]='\0';
	char *token;
	token= strtok(input ,",");
	int j=0;
	while(token!=NULL && token!="\n")
	{
	if(j==0)
	strcpy(sno,token);
	else if(j==1)
	strcpy(roll,token);
	else if(j==2)
	strcpy(sname,token);
	else if(j==3)
	strcpy(cid,token);
	else if(j==4)
	strcpy(cname,token);
	token= strtok(NULL ,",");
	j++;
	}
	fprintf(f2,"INSERT INTO hss_table03 VALUES (%s,%s,'%s','%s','%s');\n",sno,roll,sname,cid,cname);
	}
	fclose(f3);
}
	