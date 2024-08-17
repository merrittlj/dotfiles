if [[ $(battery) < 25 ]] && [[ "$(acpi)" == *"Discharging"* ]]
then
	echo "low"
fi
