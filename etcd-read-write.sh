for number in {1..10000}
do
  if curl -s http://10.0.65.70:4001/v2/keys/message -XPUT -d value="$number"; then
    #echo -e "\033[32m Data written successfully through 10.0.65.70"
    value=$(curl -s http://10.0.65.70:4001/v2/keys/message | jq -r '.node | .value')
    if [ "$value" != "$number" ] 
    then
       echo -e "\033[31m ERROR reading from 10.0.65.70"
    fi
  fi

  if curl -s http://10.0.65.71:4001/v2/keys/message -XPUT -d value="$number"; then
    #echo -e "\033[32m Data written successfully through 10.0.65.71"
    value=$(curl -s http://10.0.65.71:4001/v2/keys/message | jq -r '.node | .value')
    if [ "$value" != "$number" ]
    then
       echo -e "\033[31m ERROR reading from 10.0.65.71"
    fi
  fi

  if curl -s http://10.0.65.72:4001/v2/keys/message -XPUT -d value="$number"; then
    #echo -e "\033[32m Data written successfully through 10.0.65.72"
    value=$(curl -s http://10.0.65.72:4001/v2/keys/message | jq -r '.node | .value')
    if [ "$value" != "$number" ] 
    then
       echo -e "\033[31m ERROR reading from 10.0.65.72"
    fi
  fi
done
