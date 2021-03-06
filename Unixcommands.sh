###Unix Codes- created by Gerson Oliveira Junior/ modified by Francisco José de Novais

To redirect standard output to a file, the ">" character is used.
If you want the new results to be appended to an existed file instead, use ">>"

#####AWK

```
awk '$9!=0 {print $0}' file                          #remove all animals with 0 in the column 9
```

```
awk '!_[$1]++' file                                   #remove duplicated values from column 1
```

```
awk '_[$1]++' file                                    #print duplicatd values from column 1
```

```
awk '{if($8=="BB") ($8="2"); print}'  FinalReport        #change BB by 2 in the column 8
```

```
awk '{print $NF}' file                                       #print the last column
```

```
awk '{print NF}' tmp                                         #print number of columns
```

```
awk '{printf "%-8s %-9s %-9s %-6s %-10s %-7s %-1s\n", $1,$2,$3,$4,$5,$6,$7}' ped_tmp     #organize the file ped_tmp
```

```
awk -F"\t" 'NR>9{print $_}' file         #NR = NUMBER OF RECORDS. It'll read only after the row 9
                                          #-F = Indicates the delimiter of the file. It can be “,” , “\t” , “ “, etc  
``` 

```
awk -F"," 'NR>6 {print $9”\t”$2”\t”0\t”$10}' file 		#the file is delimeted by ','. Print columns 9,2, one column with                                                                     zeros and column 10, tab delimeted.
```

```
awk '$5 >.8' sol_and_acc                                    #print values of the column 5 bigger than .8 of the file sol_and_acc
```

```
awk -F"\t" '{gsub("-","0",$4); gsub("-","0",$5); print}' file       #change – by 0 in the columns 4 and 5.
```

```
awk '{print $1, length($2)}' geno3.txt                          #print the size of column 2
```

```
awk '{print NR,$2,$3,$1}' snpmap.txt             #the first column will be a indexx.
```

```
awk '{if(min=="")min=max=$7} ($7>max) {max=$7} ($7<min) {min=$7} {{total+=$7} count+=1} END {print total/count, min, max}' file        #min max and mean of the column 7
```

```
awk '{total+=$7} END {print total/NR}' plink.ld              #print mean of column 7
```

```
awk '{ sum+=$1} END {print sum}'                            #sum values of column 1
```

```
awk '{for(f=1; f<=NF; f++) a[NR, f]=$f} NF > nf{nf=NF} END {for (f=1; f<=nf; f++) for (r=1; r<=NR; r++) printf a[r,f] (r==NR ? RS : FS)}' file                                                 #Tranpose the file
```

```
awk '{for (i=1;i<=NF;i++) $i=substr($i,1,3)}1' tmp           #catch the 3 first characters of each column
```

```
awk 'NR>10 {s=""; for(i=10; i<=NF; i++) s=s$i" "; print s}' geno5V4.vcf   #catch all later columns 10, skipping the first 10 rows
```

```
awk '{ s=""; for(i=8; i<=NF; i++) s=s$i" "; print s}' file            #print all columns later column 8 
```

```
awk '{gsub("F","2",$4)}1' ped_plink.txt          #replace F by 2 na 4 coluna
```

```
awk 'NR==FNR{a[$1]=$3;next} !($1 in a) {print $0, a[$1]}' tmp tmp2   #relates files tmp tmp2. If tmp$1 != tmp2$1, print all columns in temp2 and column $3 of tmp 
```

```
awk 'NR==FNR {h[$1]=$2;next} {print $0,h[$1]}' tmp2 tmp1
```

```
awk 'NR==FNR{a[$2"_"$3]=$1;next} ($1"_"$4 in a) {print $2}' snp_info.txt geno.map
```   

```
awk 'NR==FNR {a[$1]=$2;next} {if($1 in a) print $0,a[$1]; else print $0,"-9";}' file1 file2
```

```
awk '{$3=$4=$6="" ; print}' tmp3                               #delete columns 3,4 and 6
```

```
awk 'NR>=2 && NR <=4 {print $1}' genoHD_04.txt          #print rown 2,3 and 4 of the column 1
```

```
awk '{if(substr($4,1,2)=="EN") print $0}' pp14_gift.txt       #if $4 has EN inside the first 2 digits, print.
```

```
awk '{if(substr($4,1,2)=="SE" || substr($4,1,2)=="EN") print $0}' ../pp14_gift.TXT         #if $4 has SE or EN, print
```

```
awk 'NR==1 || $2=="EN" {print $0}' animais_farm.txt > animaisEN_farm.txt
```

```
awk '{tmp=$1;$1=$2;$2=tmp; print}'           #switch column 1 with columns 2
```

```
awk 'BEGIN{FS=OFS=""} {for(i=1;i<=17;i++) {if(i%17==0) $i=$i" "}}1' genotipos_R.txt      #put space later 17th character.
```

```
awk 'BEGIN {FS="";OFS=" "} {$1=$1; print }' file                #Output the file with space between the columns
```

```
awk 'BEGIN {OFS=","} {print $5,$3,$4}' SNPchimp_50k.tsv               #output file delimited by ','
```

```
awk '{print $1,"1",int(rand()*10)}'  file                       #create a column with random values between 0 and 10.
```

```
awk '$2!=$3 {print}' tmp_hb                             #print if column 2 not equal column 3
```

```
awk '{if(substr($3,1,2)=="SM") print $0,"2"; else print $0,"1";}' pp14_outm3.txt
```

```
awk '{print $1,$2"_"$3}' 70SNPMap.txt | awk '! _[$2]++' | awk '{gsub("_"," ",$2); print}'   #remove SNPs with same position and chr
```

```
awk 'END {print NR}' file                  #print number of rows
```

```
awk 'NR==FNR {a[$1] = $3" "$4; next} !($1 in a) {a[$1] = "0 0"} {$(NF+1) = a[$1]; print $0, a[$1]}' sires_hap_chr5.txt tmp
```

```
awk '{if($3=="1") print $0,'A'; else if ($3=="2") print $0,'B'}' file
```

_________________________________________________________________________________________________________________

```
bzip2 -dk samtools-1.3.tar.bz2                                 #decompress .bz2 files
```

```
cat file                                                     #print out file contente
```

```
zcat file.gzip                                               #visualize gzip files
```

```
cat results_* > all                                          #merge all results_* in one file (all)
```

```
cat –vET file                                               #show tabulating(v) of the end (E) of the file  (T-> ^I = tab)
```

```
cat pedigree.file | rev | column -t | rev > ped_rev        #alings columns to the right. Without ‘rev’, it's on the left
```

```
cat –n file                                                #-n = number all output lines
```

```
cd -                                                       #back to the previouly folder
```

```
chmod +x file                                              #make the file executable
```

```
chmod +xwr user file                              #give permission for write, read and run the file 
```

```
clear  				                                          #clean the screen
```

```
cp $(cat list.txt) new_folder                       #copy file from a list.txt to a new_folder
```

```
cp file1 file2                                        #copy file1 to file2
                                                       #-r is required when copying directory/directories
```

```
cut -c1-100 file	                           #cut the rows between 1-100 character.
```

```
cut –d’;’ file                                #corta onde tem ponto e virgula
```

```
cut -d" " –f1 arquivo                         #show the first column (fields = -f). File delimited by space (-d)
```

```
cut -d" " –f1-3 file                         #print the first 3 columns
```

```
cut -d" " –f1,3 file                         #print the columns 1 and 3
```

```
cut -d$’\t’ -f2 file                        #delimited by tab, show column 2. The $ means: read as special character. 
```

```
cut –c file                                        #select only specific characters
```

```
declare –i chr                                #trata o array chr como numero inteiro. Assim pode fazer operações matemáticas.
```

```
df				                                  #show space in disk
```

```
date                                       #print date and time
```
```
du -sh folder                            #print size of the folder
                                        # -s doens't list the size for each subdirectory, only the total size
                                         # -h human readable
```

```
echo "message" > file1                            #save 'message' in file1
```

```
echo -e "message\tmessage2"                  #print messages delimited by tab
```

```
for file in $(<list.txt); do cp "$file" new_folder; done           #copy files from a list.txt to a new_folder.
```

```
grep word file                             #look for ‘word’ in file
```

```
grep -v "R12C02" geno1538.txt        #print all lines that not matche "R12C02"
```

```
grep -vc ^# file                          #	^ match the beginning of a line. -c = --count
```

```
gzcat arquivo.tar.gz | tar xvf -               #unzip files .tar.gz
```
```
gzip file                              #compress file  
```
```
bzip2 files                              #compress file (better than gzip)
```
```
head file                                    #print out the first 10 lines of file content
```

```
head -n40 file	             #print the first 40 rows 
```

```
head -n-10                                        #cut the last 10 rows
```

```
join -1 FIELD -2 FIELD file1 file2            #join two files in a new one. They must be sorted. -1 is the reference field for the firt file and -2 for the second.
```

```
join <(sort mapAffy_Illumina50K.txt ) <(sort G_CCGP_A-BOS1_LIM-458.txt) > fileOutput.txt
```

```
kill x                            #kill the analysis x (use 'top' to see the analysis number)
```

```
less file                #text file viewer (use q to exit)
```

```
less –S                  #for big files (lots of columns). Just print the size of your screen
```

```
ls                              #list files of the actual folder.
                                # -l get the file list with more details
                                # -h convert the size of file to a human-readable format
                                # -S sort by file size
                                # -t sort by last modify time
                                # -1 lista todos em uma coluna
```

```
man comand                 #show manual of the specific comand
```

```
mkdir folder_name          #create a new folder
```

```
more file                  #list the file (similar to less). More useful in Mac
```

```
mv file1 file2             #rename  the file
```

```
nano file                  #text editor
```

```
nohup software script &              #run the software using the servidor. So you can turn off your computer
```

```
paste -d" " ids.txt geno4.txt > geno5.txt      #paste the two files delimited by space 
```

```
perl -ne 'print if $a{$_}++' file              #print duplicated values 
```

```
pwd                                           #path work directory
```

```
ping                                          #show connection speed 
```

```
read -p "What is the chromosomes? " chr       #ask for enter a number that will be saved as chr
```

```
rm file                                    #remove file
                                           # -r is required to remove a directory if it is not empty
                                           # -f means forcely: deleting without confirm
```

```
rsync [options] source destiny            # -r recurse into directories 
                                          # -a archive mode
                                          # -v verbose
                                          # -z compress file data during the transfer
                                          # -P same as --progress
```

#####SED

```
sed s/\"//g banco.TXT > banco                              #remove "
```

```
sed 's/A/1/' file1.txt > file2		         #replace A by 1 in the firt event of each row
```

```
sed ‘s/1990/1992/g’ f1 > f                  #replace 1990 by 1992
```

```
sed '1 s/,/ /g' file.txt > out.txt              #replace , by space in the first row
```

```
sed ‘s/\x0D$//’ filetxt > file2                         #remove "enter (line break)" of the end of the rows
```

```
sed  '/^[[:space:]]*$/d' l80k.txt        #remove empty rows and space for the end of the rows.
```

```
sed "1,32 d" file.txt                                   #skip the first 32 rowns
```

```
sed  '1! s/_/ /g' run.mrkRes1                           #skip the first line and replace _ by space
```

```
sed '1 s/-/ /2' file                                #replace '-' by space in the second event of the first line
```

```
sed 's/ \+/ /g'                                     #replace more than one space by one space
```

```
sed 's/^ *//'                                        #remove space of the first column
```

```
sed 's/\// /g'                                        #replace / by space
```

```
sed 's/\t/ /g' file                                   #replace tab by space
```

```
sed -e '/\..\//s/\..\//..\/..\//g'                    #replace ../ by ../../
```

```
sed 'y/aãáaàeéeèiíiìoóoòõuúuùuuuuAÁAÀEÉEÈIÍIÌOÓOÒUÚUÙUUUU/aaaaaeeeeiiiiooooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/' file | sed 's/\ç/c/g'                                               ##Remove accent
```

__________________________________________________________________________________________________________________________________

```
sdiff -s pos80.txt posHD1.txt           #show different rowns. It's not a good one.
```

```
shift zz 				               #salve the file when it is open as "vi file"
```

```
shift+g                    #go to the end of the file when use the function "vi file"
``` 				               

```
sort –n 		                   #sort by numeric function
```

```
sort –k2 aquivo                            #sort by the 2 column
```

```
sort -n -k7 -k8 arquivo                    #sort by the 7 and 8 column in numeric order (-n)
```

```
sort –u                                    #sort unic values. I don't like this command.
```

```
sort -R input                           #Suffle(–R) the file 'input'
```

```
ssh -l username 143.107.190.101          #accessing another machine 
```

```
ssh usuario@IP:DOOR   
```

```
scp user@IP:/home/folder/cnv_Gir/penncnv/*.zip ~/FOLDER     #copy file(s) to a remote server                                                                                                      # -r for copy entire folders
```

```scp gerson_jr@143.107.190.106:/home/gerson_jr/GenSel_Convert/gensel.txt /home/users/dorian/Gerson/gensel.txt```

```
tail  arquivo                #print out the last 10 lines of file content
```

```
tail -n +2 file                    # Skip the first row
```
```
tar -zcvf out.tgz files                       #compress files
tar -jcvf out.tbz2 files                      # -c create a new archive
                                              # -v verbosely list files processed
                                              # -f use archive file 
                                              # -j bzip2
                                              # -z bzip
                                            

tar -xvf nome_arquivo_compactad               #uncompress .tar
                                              # -x extract files from an archive
                                              # -z --gzip, --gunzip --ungzip
```

```
top                                            #show analyses that are running
```

```
transpose  –t --fsep “\t”-l 698741x45 file > new file                 #transpose a file
```

```
wc                     #word count
                       # –l count rowns 
                       # -w count columns
```

```
wget                            #baixar packages or githup raw files
                                #e.g.: wget https://raw.githubusercontent.com/gersonjr/scripts/master/Unix_Commands.md
```

```
uniq –d –c                        #show repeted values (-d) and count them (-c). Sometimes does not work!
```

```
unzip exemplo.zip               #uncompress .zip
```

```
unxz file.xz                  #open xz files
```

```
xargs --arg-file=list.txt cp --target-directory=new_folder        #copy files from a list.txt to a new_folder
```
__________________________________________________________________________________________________________________________
