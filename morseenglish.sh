#!/bin/bash


# Define the Morse code alphabet
declare -A morse_code
morse_code[".-"]="A"
morse_code["-..."]="B"
morse_code["-.-."]="C"
morse_code["-.."]="D"
morse_code["."]="E"
morse_code["..-."]="F"
morse_code["--."]="G"
morse_code["...."]="H"
morse_code[".."]="I"
morse_code[".---"]="J"
morse_code["-.-"]="K"
morse_code[".-.."]="L"
morse_code["--"]="M"
morse_code["-."]="N"
morse_code["---"]="O"
morse_code[".--."]="P"
morse_code["--.-"]="Q"
morse_code[".-."]="R"
morse_code["..."]="S"
morse_code["-"]="T"
morse_code["..-"]="U"
morse_code["...-"]="V"
morse_code[".--"]="W"
morse_code["-..-"]="X"
morse_code["-.--"]="Y"
morse_code["--.."]="Z"
morse_code["-----"]="0"
morse_code[".----"]="1"
morse_code["..---"]="2"
morse_code["...--"]="3"
morse_code["....-"]="4"
morse_code["....."]="5"
morse_code["-...."]="6"
morse_code["--..."]="7"
morse_code["---.."]="8"
morse_code["----."]="9"

  # Inverse Morse code array
declare -A morse_code_inverse
for key in "${!morse_code[@]}"
do
  morse_code_inverse[${morse_code[$key]}]=$key
done
echo
echo "What do you want to do?(1/2/3)"
echo "1. Morse code => English"
echo "2. English    => Morse code"
echo "3. Nothing!"
read input
echo
case $input in

	1) 

  # Message from the user
echo "Enter the Morse code message:"
read message

  # Message into words
IFS='  ' read -ra words <<< "$message"

  # Decode each word
for word in "${words[@]}"
do
  # Word into letters
  IFS=' ' read -ra letters <<< "$word"

  # Decode each letter
  for letter in "${letters[@]}"
  do
   # Corresponding letter in the Morse code array
    decoded_letter=${morse_code[$letter]}

   # Print
    printf "%s" "$decoded_letter"
  done

   # Space
  printf " "
done

echo

	;;

	2)

  # Message from the user
echo "Enter the message:"
read text
  # Input to Uppercase
message=${text^^}

  # Message to Morse code
for ((i=0;i<${#message};i++))
do
  # Corresponding Morse code for the alphabet in inverse morse code array
  char=${message:$i:1}
if [[ "$char" == " " ]]
then
  printf " "
else
  morse=${morse_code_inverse[$char]}
  # Print
  printf "%s" "$morse"
  printf " "
fi
  done
echo

	;;

	3)
	
echo "Thank you!!"
	;;
	
	*)
echo "Invalid Option!!"
	;;

	esac
  # Finish
