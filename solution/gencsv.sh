count2=0
arrVar=("234" "98" "34" "110" "13" "27" "32" "134" "221" "189") 
arrVar+=("$@")

for value in "${arrVar[@]}"
do
     echo $count2, $value
     ((count2++)) 
done