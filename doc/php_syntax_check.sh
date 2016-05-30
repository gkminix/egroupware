#!/bin/bash
################################################################################
### Tool to check for PHP Syntax errors
### Usage: doc/php_syntax_check [file or directory, defaults to whole egrouware]
### Will output all PHP Fatal, Parse erros and also Deprecated incl. filename
### Exit-status: 0 on no error, but maybe Deprecated warnings, 1 on error
################################################################################

cd `dirname $0`
cd ..

# exclude old / not used PEAR Autoloader giving PHP Fatal error:  Method PEAR_Autoloader::__call() must take exactly 2 arguments

find ${@-.} -name '*.php' ! -path '*vendor/pear-pear.php.net/PEAR/PEAR/Autoloader.php' -exec php -l {} \; 2>&1 | \
	#grep -v 'No syntax errors detected in' | \
	grep '^PHP' | \
	perl -pe 'END { exit $status } $status=1 if /^PHP (Fatal|Parse error)/;'
