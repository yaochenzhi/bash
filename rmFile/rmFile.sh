files=$(ls $1)
for file in $files
do
  file=$1/$file
  backAt=$(stat -c '%Y' $file) 
  echo
  echo File $file was created at $backAt \(seconds from Epoch\)
  let "interval=$(date +%s) - $backAt"
  let "aMonth=86400*31"
  if (( $interval > $aMonth ));then
    echo Interval $interval is greater than a month $aMonth \n Removing file $file
    rm -f $file
  else
    echo -e "Interval is in a month.\nFile $file to be remained."
  fi
  echo
done
echo All is done
echo
exit 0
