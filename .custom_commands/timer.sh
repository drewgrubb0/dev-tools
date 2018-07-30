function timer(){
    NUM_SECONDS=$1

    if [ -z "${NUM_SECONDS}" ]; then
        echo "usage: timer [num_seconds] (options)"
        return 1
    fi
    #shift away seconds
    shift

    while [[ $# -gt 0 ]]
    do
        case "$1" in
            -v|--verbose)
                SHOW_TIMER="true"
                shift
                ;;
        esac
    done

    if [ SHOW_TIMER = "true" ]; then
        echo ${NUM_SECONDS}
    fi

    SECONDS_LEFT=${NUM_SECONDS}
    while [ $SECONDS_LEFT -gt 0 ]
    do
        sleep 1
        ((SECONDS_LEFT--))
        if [ SHOW_TIMER = "true" ]; then
            echo "${SECONDS_LEFT}"
        fi
    done

    NUM_ALARMS=0
    while [ $NUM_ALARMS -lt 7 ]
    do
        echo -e "\a"
        sleep .1
        ((NUM_ALARMS++))
    done
}