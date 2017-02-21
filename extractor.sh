echo "please enter path of folder to parse, relative to current directory:"
echo $(pwd)
read folder
mkdir $folder/parsed
for file in $folder/*.xml
	do
		cat $file | grep '<component group="image" name="selected">' |sed -e 's_<component group="image" name="selected">__g' -e 's_</component>__g' -e '/^<entry/d' >> result.txt
		echo "$file Parsed"
	done
echo "Parsed file can be found at:"
echo "$folder/parsed"
