echo "Running unit tests:"

test_executables=tests/check_*[!*.c]

for i in $test_executables
do
  if test -f $i
  then
    if $VALGRIND ./$i 2>> tests/tests.log
    then
      echo $i PASS
    else
      echo "ERROR in test $i: here's tests/tests.log"
      echo "------"
      tail tests/tests.log
      exit 1
    fi
  fi
done

echo ""
