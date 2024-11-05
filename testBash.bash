for a in $(find $PWD | grep -E "\.c$|\.h$")
do 
	((PARSED = 0))
	((LINE = 0))
	for b in $(awk '{print length}' $a)
	do
		((LINE += 1))
		if (($b >= 80));	then 
			if ((PARSED == 0)); then 
				echo "$a :"
				((PARSED = 1));
			fi
			echo "l.$LINE too long ( $b cols )";
		fi; 
	done
done
