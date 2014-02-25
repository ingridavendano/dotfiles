

# provides the absolute path of a directory or file
function abspath {
  if [ -d "$1" ]; then
    (cd "$1" && pwd)
  else
    if [[ ! -a "$1" ]]; then
      echo "Warning, file does not exist" 1>&2
    fi
    echo "$(abspath $(dirname $1))/$(basename $1)"
  fi
}