#builtin
echo -en
type -aPpft
'' "" \ only escape \$`` $''

1. brace expansion
a{b,c,d}e
{1..10..2}

2. tilde expansion
~
~zhangzn
~+
~-
~+-n
dirs pushd popd

3. parameter expansion
"$@":"$1" "$2"   "$*":"$1IFS$2", str1"$@"str2 is cat
${parameter:-word} :+ := :? 
${parameter:offset}
${parameter:offset:length}
declare: declare [-aAfFgilnrtux] [-p] [name[=value] ...]
set -- params
${#@}/$# is to show num of pos params, var=$@ is not the way, since it also experiencing expansion
${@:7} include file name as first arg
${array[@|*]:7}
${!prefix*|@} arg name
${!name[@|*]} indices
${#parameter} str, arr, pos
${parameter#word} start, shortest, apply each for arr and pos
${parameter##word} longest
${parameter%word} end, shortest, apply each for arr and pos
${parameter%%word} longest
${parameter/pattern/string} #is start, %is end, if param is @|*, do for arr and pos
${parameter//pattern/string} replace all
${parameter^pattern} first letter with pattern, upper
${parameter^^pattern} all letters with pattern, upper
${parameter,pattern} first letter with pattern, lower
${parameter,,pattern} all letter with pattern, lower

4. command substitution
$(command)
`command` \ only escape \$``
$(cat file) can be replaced by the equivalent but faster $(< file)

5. arithmatic expansion
$(( expression )) The 'expression' is treated as if it were within double quotes

6. process substitution
<(list) >(list) Process substitution allows a process’s input or output to be referred to using a filename
process substitution is performed simultaneously with parameter and variable expansion, command substitution, and arithmetic expansion

7. word splitting
word splitting is for substitution and not for double quote
word splitting:
	if default:
		strip 3kindofspace -> delimiter is seq of 3kindofspace
	if otherchar and somekindofspace(space tab):
		strip somekindofspace -> delimiter is one otherchar with seq of adj somekindofspaces
	if otherchar:
		delimiter is one otherchar (if last char is delimiter, it will not be counted)
null removal
	"" or '' - not removed
	$null - removed
	"$null" - not removed

8. pathname expansion
	* ? [ab]
	[a-d] [!^a-d]
	[:class:]
	alnum alpha ascii blank cntrl digit graph lower print punct space upper word xdigit

9. quote removal
	unquoted \ \' and \" will be removed

word splitting and path name will not be perfomed in
	1. assignment
	2. [[]]
	3. ""
Only  brace expansion, word splitting, and pathname expansion can change the number of words of the expansion; other expansions expand a single word to a single word.  The only exceptions to this are
       the expansions of "$@" and "${name[@]}" as explained above (see PARAMETERS)

local var, all var in func will be local before func is called

echo $(( 2#101011 )) base conversion
"case": ;; ;;& ;& execute next
. "source" is same as include in C, replace code physically
,: ((expr,expr)) -- cat -- /{,usr/}bin/*calc: /bin/calculation, /usr/bin/calculation -- lowercase substitution

\x = 'x'

: true are builtin of NOP, can be used as "pass" in python


printf "%s %s" $1 $2 
[while IFS=:] read -rasn:put $1 $2 [; do ; done] <$file
eval \$$1
set -- [$vars]
declare -riafx
shopt -su
exec #substitute shell
caller n
jobs fg bg
kill disown wait
while getopts ":abcde:fg" Option
do
  case $Option in
    a) echo $OPTIND" is next pos";;
    e) echo $OPTARG;;
  esac
done

#external
ls -StvXRiblF
cat -vtenbs #tac rev paste join
cp -ur
ln -s
find . -name '' -type f -mtime -atime -ctime [+|-] 1 -maxdepth -inum -perm -exec `` {} [\;|+]
grep -rnliwZvcHqABoEF [-e] $pattern [$file | $dir]
[grep -lZ | find -print0] | xargs -0n:P:I:tl:p
expr length match substr index :
date -ud: +%kMjs

#text
sort -mnrft -k(f.cp,f.cp) $file1 $file2
sort | uniq -c | sort -nr
cut -d:f:,:c:-:
head -cn
tail -cnf

sed -en [// | n],[// | n]/[p | d | s/[]/[]/g | y/[]/[]/g ] $file
sed -en num i str $file