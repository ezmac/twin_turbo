#!/bin/sh
echo "Content-type: text/html\n\n";

#echo `date` $REQUESTSCRIPT >>/tmp/test.txt
#echo `date` $REQUESTSCRIPT
echo $BASEDIR$REQUESTSCRIPT>>/tmp/test.txt
echo $SELECTOR >>/tmp/test.txt
cat $BASEDIR$REQUESTSCRIPT |./pup "$SELECTOR"
