#!/bin/bash
# Measures the performance of the site with ApacheBench

no_of_requests=5

uid=0
url=""

while getopts u:l: opt
do
  case "$opt" in
    u) uid=$OPTARG;;
    l) url=$OPTARG;;
  esac
done;

if [ -z "$url" ]
then
  echo "Usage: $0 [-u 1] -l http://example.com"
  echo "When using the -u option, you must be in a Drupal root directory recognized by Drush"
  exit 1
fi

if [ $uid -eq 0 ]
then
  # Benchmark it as anonymous
  ab -n $no_of_requests -g perf`date +%s`.dat $url
else
  # Benchmark it as logged in user
  cookie_file=`mktemp`
  # Grab a valid session cookie using one-time link and wget
  wget --quiet --output-document=/dev/null --save-cookies=$cookie_file `drush uli $uid --browser=0 -l $url`
  cookie=`fgrep SESS $cookie_file | awk '{print $6"="$7}'`
  # Pass this cookie to AB
  ab -C "$cookie" -n $no_of_requests -g perf-`date +%s`.dat $url
  rm $cookie_file
fi

exit
