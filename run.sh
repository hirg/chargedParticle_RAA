if [ $# -ne 2 ]
then
  echo "Usage: ./run.sh <condor_iteration> <njobs>"
  exit 1
fi

sleep $(($1/2))

echo | awk -v j=$1 -v k=$2 '{print "./run.exe fileList.txt "j" "k}' 
echo | awk -v j=$1 -v k=$2 '{print "./run.exe fileList.txt "j" "k}' | bash

echo | awk -v tag=$4 -v user=$USER '{print "mv output*.root /mnt/hadoop/cms/store/user/"user"/temporaryStorage/"}'
echo | awk -v tag=$4 -v user=$USER '{print "mv output*.root /mnt/hadoop/cms/store/user/"user"/temporaryStorage/"}' | bash
rm *.root
echo "job done successfully"
