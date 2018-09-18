#!/bin/sh
function getTiming(){
    start=$1
    end=$2

    start_s=`echo $start | cut -d '.' -f 1`
    start_ns=`echo $start | cut -d '.' -f 2`
    end_s=`echo $end | cut -d '.' -f 1`
    end_ns=`echo $end | cut -d '.' -f 2`

    time_micro=$(( (10#$end_s-10#$start_s)*1000000 + (10#$end_ns/1000 - 10#$start_ns/1000) ))
    time_ms=`expr $time_micro/1000  | bc `

    echo "$time_micro microseconds"
    echo "$time_ms ms"
}

begin_time=`date +%s.%N`
sleep 10
end_time=`date +%s.%N`

getTiming $begin_time $end_time
