/proc/round_down(num)
	if(round(num) != num)
		return round(num--)
	else
		return num
