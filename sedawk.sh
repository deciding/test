#regex
#basic: char,pos,expand
grep -e '^.*[^a-z]\<\>$'
#Expanded can -e escape
grep -E '?+(){}(|)'
#POSIX
grep -E '[[:digit:]]' #alnum alpha lower uper space blank...

#glob
ls {?*,[^a-z]*}

# every finish will print cur
#line: n or //, range: line,line, ops: d p i'' or s///g y///, multi: ; or {nested}
sed -i -n -e '6,/GUI/p;/GUI/,/^$/{/^.*$/s/([a-z])[a-z]/\1\n/g;1,2y/[a-z]/[A-Z];3i 3rd line}' $file
sed -f $prog $file
#s///g,n(nth),p(print)/w file
#i \,a \,c \(can range)
#=, line number
#n read next line, with printing cur, without start from script begining
#p continue to script
#d read next line and start from the begining
#r w $file (read and append)
#q quit
#$ means file end
#/[0-9]/s//print:&/ or s/[0-9]/print:&/, & means prev regex
#[address]!{}, not that addres, do ops

#advanced

#N(append next line, replace pattern space, not print, continue script, print)
#P(print first line, not clear pattern space, not read new line, start from begin of script)
#D(delete first line, not clear other pattern space, not read new line, start from begin of script)
#NPD always write in this order, to have a two line process as a loop, while only output first one

#hold space vs. pattern space
#hHgGx, upper case means append

#:label
#[address]b[label]
#substitute;[address]t[label]
#if label not supplied, jump to end



#awk
awk -F: 'BEGIN{ FS="\t+" };$1 !~ /the/ {print $1,$2, $(3+5) };END{}'
#print comma, space
#printf("",)
#print by default print this line,$0
# y=x++ and many other operations
#System vars: FS, OFS, NF, RS, ORS, NR, FNR, FILENAME, CONVFMT(num->str, %.6g), ARGV[], ENVIRON[]
#space is string concatention
awk 'script' var1=value1 inputfile1 var2=value2 inputfile2 #passing param while reading inputs
awk -v var=value 'script' inputfile #passing param before reading inputs
#flow: while do for in if else continue break, 
#ds: json like array
#item in array: test
#delete arr[n]
#next: get next record and start over
#exit n: go to END
#functions: match(str,regex[,arrGroup]) RSTART RLENGTH, sub/gsub(regex,replacement[,target]) & \\&
#functions: split(str, arrRes[, sep, arrSepRes]), substr(str,start[,len])
#functions
cos(x)
exp(x)
int(x)
log(x)
sin(x)
sqrt(x).
atan2(y,x)
rand()
srand(x)

gsub(r,s,t)
	Globally substitutes s for each match of the regular expression r in the string t.
	Returns the number of substitutions. If t is not supplied, defaults to $0.
	
index(s,t)
	Returns position of substring t in string s or zero if not present.
	
length(s)
	Returns length of string s or length of $0 if no string is supplied.
	
match(s,r)
	Returns either the position in s where the regular expression r begins, or 0 if no
	occurrences are found. Sets the values of RSTART and RLENGTH.
	
split(s,a,sep)
	Parses string s into elements of array a using field separator sep; returns number
	of elements. If sep is not supplied, FS is used. Array splitting works the same
	way as field splitting.

sprintf("fmt",expr) 
	Uses printf format specification for expr.
	
sub(r,s,t)
	Substitutes s for first match of the regular expression r in the string t. Returns 1
	if successful; 0 otherwise. If t is not supplied, defaults to $0.
	
substr(s,p,n)
	Returns substring of string s at beginning position p up to a maximum length of
	n. If n is not supplied, the rest of the string from p is used.
	
tolower(s)
	Translates all uppercase characters in string s to lowercase and returns the new
	string.
	
toupper(s)
	Translates all lowercase characters in string s to uppercase and returns the new
	string.

#self defined functions
#function name (parameter-list) {
# 	statements
# 	return expression
#}