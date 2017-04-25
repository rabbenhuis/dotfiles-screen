# Function to run a command in a fresh screen.
function scr() {
	# Get the current directory and the name of the command
	local working_dir=`pwd`
	local command=$1
	shift

	if [[ -z ${STY} ]]; then
		# Not in screen so run the command.
		${command} $*
	else
		# Use screen to run the command.
		screen -X chdir ${working_dir}

		if [[ ${command} == "ssh" ]]; then
			local ssh_server="${3##*@}"
			local ssh_user=$2
			local ssh_os=`ssh -l ${ssh_user} ${ssh_server} uname`

			screen -X screen -t "$ssh_server" ${command} $*
		else
			screen -X screen -t "$command $*" ${command} $*
		fi
	fi
}

alias man='scr man $*'
alias info='scr info $*'
alias tail='scr tail $*'
