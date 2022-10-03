if [ "echo script.sh | grep -m 1 $" = "#!/bin/bash" ] && ["echo script.sh | grep -m 2 $" = "ok" ] ;then 
	echo "ok" 

else
	echo "pd"
fi

