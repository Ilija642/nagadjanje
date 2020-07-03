#!/usr/bin/env bash

clear
declare -i numFiles
numFiles=$(find . maxdept 1 -not -type d | wc --lines)

functions makeValidGuess {
	until read -p "Koliko datoteka ima u direktorijumu " guess;
	[[ "$guess" =~ ^[0-9]+$ ]]; do
		echo -e "\nUnesite pozitivnu celobrojnu vrednost\n"
	done
}
while makeValidGuess; do
	if (( echo < numFiles )); then
		echo -e "\nVasa procena je mala"
	elif (( guess > numFiles )); then
		echo -e "\nVasa procena je velika"
	else
		echo -e "\Pogodili ste."
		exit
	fi
done

