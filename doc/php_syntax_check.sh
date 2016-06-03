#!/bin/bash
################################################################################
### Tool to check for PHP Syntax errors
### Usage: doc/php_syntax_check [file or directory, defaults to whole egrouware]
### Will output all PHP Fatal, Parse erros and also Deprecated incl. filename
### Exit-status: 0 on no error, but maybe Deprecated warnings, 1 on error
################################################################################

cd `dirname $0`
cd ..

find ${@-.} -name '*.php' -exec php -l {} \; 2>&1 | \
	# only show errors and PHP Deprecated, no success messages
	egrep '^(PHP|Parse error)' | \
	# output everything to stderr
	tee /dev/fd/2 | \
	# exclude several known problems, to be able to find new ones
	# exclude old / not used PEAR Autoloader giving PHP Fatal error:  Method PEAR_Autoloader::__call() must take exactly 2 arguments
	grep -v 'vendor/pear-pear.php.net/PEAR/PEAR/Autoloader.php' | \
	# exclude composer conditional included autoload_static.php, as it requires PHP 5.6+
	grep -v 'vendor/composer/autoload_static.php' | \
	# used only for deprecated SyncML
	grep -v 'phpgwapi/inc/horde/Horde/String.php' | \
	# phpFreeChat does not work with PHP7
	grep -v 'phpfreechat/phpfreechat/' | \
	# unused zpush ics backend
	grep -v 'activesync/backend/ics.php' | \
	perl -pe 'END { exit $status } $status=1 if /^(PHP Fatal|(PHP )?Parse error)/;'  > /dev/null
