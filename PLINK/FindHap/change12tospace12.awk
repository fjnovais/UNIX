#!/usr/bin/gawk -f
###########################################
######  Recode allele dosage 0-2 ##########
######         to                ##########
######    Alleles 11,12,22       ##########
###########################################

BEGIN {FS="";OFS=" "} 
{
for (i=1;i<=NF;i++) 
{
if($i=="1") $i="1"; 
else if($i=="2") $i="2"
} 
print
}

