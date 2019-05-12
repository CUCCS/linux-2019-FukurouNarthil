function help {
	echo "	-h help"
	echo "	-c compress one picture"
	echo "  -C compress all pictures"
	echo "	-w embed watermark"
	echo "	-p prefix"
	echo "	-s suffix"
	echo "	-t transform"
}

function compress {
	for i in *.jpg
	do 
		convert "$i" -quality 95 "$2" ../share/"$i"
	done
}

function compress_jpeg {
	for i in *;
	do 
		convert "$i" -resize "$2" ../share/"$i"
	done
}

function embed {
	for i in *;
	do
		convert "$i" -fill black -pointsize 13 -draw "text 10,15 '$2'" ../share/"$i"
	done
}

function prefix {
	for i in *;
	do 
		mv "$i" ../share/"$2""$i"
	done
}

function suffix {
	for i in *;
	do
		filename="$i"
		extension=${filename##*.}
		filename=$(echo "$i" | cut -d . -f1)
		cp "$i" ../"$filename""$2"".""$extension"
	done
}

function convert_to_jpeg {
	for i in *png;
	do 
		filename="$i"
		extension=${filename##.}
		filename=$(echo "$i" | cut -d . -f1)
		convert "$i" ../"$filename"".jpg"
	done
	for i in *svg;
	do 
		filename="$i"
		extension=${filename##.}
		filename=$(echo "$i" | cut -d . -f1)
		convert "$i" ../"filename"".jpg"
	done
}

if [[ "$#" -lt 1 ]]; then
	echo "argument too short."
else
	cd "$1"
	shift 1
	until [ "$#" -eq 0 ]
	do
		case "$1" in
			"-c")
				if [[ "$2" != '' ]];then
					compress "$@"
					shift 2
				else
					echo "missing an argument"
				fi
				;;
			"-C")
				if [[ "$2" != '' ]];then
					compress_jpeg "$@"
					shift 2
				else
					echo "missing an argument"
				fi
				;;
			"-w")
				if [[ "$2" != '' ]];then
					embed "$@"
					shift 2
				else
					echo "missing an argument"
				fi
				;;
			"-p")
				if [[ "$2" != '' ]];then
					prefix "$@"
					shift 2
				else
					echo "missing an argument"
				fi
				;;
			"-s")
				if [[ "$2" != '' ]];then
					suffix "$@"
					shift 2
				else
					echo "missing an argument"
				fi
				;;
			"-t")
				convert_to_jpeg "$@"
				shift
				;;
			"-h")
				help
				shift
				;;
		esac
	done
fi

			

