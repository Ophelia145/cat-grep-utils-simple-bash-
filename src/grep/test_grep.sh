        #!/bin/bash

SUCCESS=0
FAIL=0
 touch test1.txt
 touch test2.txt
echo -e "a34gdfdgfdgfdfg\n\ntest string\nanother test string\ntest\n1\nd\n" > test1.txt
echo -e "1\ndsr2\n12212\nrew\ntest string\nHello world\nhello world\nHELLO WORLD?" > test2.txt

files_list=(test1.txt test2.txt)
ok=1

echo "Testcase 1: without flags"
./s21_grep a $files_list > sg21.txt
grep a $files_list > grep.txt
diff sg21.txt grep.txt > /dev/null
if [[ $? != 0 && $ok="1" ]]; then
    echo "FAILED"
    ((FAIL++))
    $ok=0
elif [[ $ok -eq "1" ]]; then
    echo "SUCCESS"
    ((SUCCESS++)) 

    
fi

if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 2: without flags "
  ./s21_grep -e "[a-z]" -e "[0-9]" $files_list > sg21.txt
  grep -e "[a-z]" -e "[0-9]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi

if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 3: flag -i"
  ./s21_grep -i  a $files_list > sg21.txt
  grep -i a $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi

if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 4: flag -n"
  ./s21_grep -n a $files_list > sg21.txt
  grep -n a $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi

if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 5: flag -nv"
  ./s21_grep -nv a $files_list > sg21.txt
  grep -nv a $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi



if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 6: flag -v -i "
  ./s21_grep [0-9] -v -i $files_list  > sg21.txt
  grep [0-9] -v -i $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi



if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 7: -c -e "[a-z]""
  ./s21_grep -c -e "[a-z]" $files_list > sg21.txt
  grep -c -e "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && "$ok" -eq "1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ "$ok" -eq "1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi

if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 8: -l"
  ./s21_grep -l -e "[a-z]" $files_list > sg21.txt
  grep -l -e "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi

if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 9: -c -e =multifile multitemplate"
  ./s21_grep -c -e "[a-z]" $files_list > sg21.txt
  grep -c -e "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi



if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 10: -l -e"
  ./s21_grep -l -e "[a-z]" $files_list > sg21.txt
  grep -l -e "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi


if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 11: -l -c -e"
  ./s21_grep -l -c -e "[a-z]" $files_list > sg21.txt
  grep -l -c -e "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi



if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 12: -l -n -e"
  ./s21_grep -l -n -e "[a-z]" $files_list > sg21.txt
  grep -l -n -e "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi


if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 13: -l -e"
  ./s21_grep -l -e "[a-z]" $files_list > sg21.txt
  grep -l -e "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi
if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 14: -n -v"
  ./s21_grep -n -v "[a-z]" $files_list > sg21.txt
  grep -n -v "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi
if [[ "$ok" -eq "1" ]]; then
  echo "Testcase 13: -n -c"
  ./s21_grep -n -c "[a-z]" $files_list > sg21.txt
  grep -n -c "[a-z]" $files_list > grep.txt
  diff sg21.txt grep.txt > /dev/null
  if [[ $? != 0 && $ok="1" ]]; then
      echo "FAILED"
      ((FAIL++))
      $ok=0
  elif [[ $ok="1" ]]; then
      echo "SUCCESS"
      ((SUCCESS++))
  fi
fi


echo "УСПЕХ: $SUCCESS"
echo "ПРОВАЛ: $FAIL"



rm -rf sg21.txt
rm -rf grep.txt
rm -f test1.txt test2.txt s21_output.txt grep_output.txt