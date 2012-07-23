<?php
/**
 * EGroupware - eTemplate serverside date widget
 *
 * @license http://opensource.org/licenses/gpl-license.php GPL - GNU General Public License
 * @package etemplate
 * @subpackage api
 * @link http://www.egroupware.org
 * @author Ralf Becker <RalfBecker@outdoor-training.de>
 * @copyright 2002-11 by RalfBecker@outdoor-training.de
 * @author Nathan Gray
 * @copyright 2011 Nathan Gray
 * @version $Id$
 */

/**
 * eTemplate date widget
 *
 * Deals with date and time.  Overridden to handle date-houronly as a transform
 *
 * Supported attributes: dataformat[,mode]
 *  dataformat: '' = timestamps or automatic conversation, or eg. 'Y-m-d H:i:s' for 2002-12-31 23:59:59
 *  mode: &1 = year is int-input not selectbox, &2 = show a [Today] button, (html-UI always uses jscal and dont care for &1+&2)
 *           &4 = 1min steps for time (default is 5min, with fallback to 1min if value is not in 5min-steps),
 *           &8 = dont show time for readonly and type date-time if time is 0:00,
 *           &16 = prefix r/o display with dow
 *           &32 = prefix r/o display with week-number
 *			 &64 = prefix r/o display with weeknumber and dow
 *           &128 = no icon to trigger popup, click into input trigers it, also removing the separators to save space
 *
 * @todo validation of date-duration
 */
class etemplate_widget_date extends etemplate_widget_transformer
{
	protected static $transformation = array(
		'type' => array('date-houronly' => 'select-hour')
	);

	/**
	 * (Array of) comma-separated list of legacy options to automatically replace when parsing with set_attrs
	 *
	 * @var string|array
	 */
	protected $legacy_options = 'dataformat,mode';

	/**
	 * Change value to be an integer - client side only deals in timestamps
	 */
	public function beforeSendToClient($cname)
	{
		$form_name = self::form_name($cname, $this->id);
		$value =& self::get_array(self::$request->content, $form_name, true);
		if ($value && !empty($this->attrs['dataformat']))	// Non-integer timestamp
		{
			$date = DateTime::createFromFormat($this->attrs['dataformat'], $value);
			if($date) $value = $date->getTimestamp();
		}
	}

	/**
	 * Validate input
	 *
	 * @param string $cname current namespace
	 * @param array $expand values for keys 'c', 'row', 'c_', 'row_', 'cont'
	 * @param array $content
	 * @param array &$validated=array() validated content
	 * @return boolean true if no validation error, false otherwise
	 */
	public function validate($cname, array $expand, array $content, &$validated=array())
	{
		$form_name = self::form_name($cname, $this->id, $expand);

		if (!$this->is_readonly($cname, $form_name) && $this->type != 'date-since')	// date-since is always readonly
		{
			$value = self::get_array($content, $form_name);
			$valid =& self::get_array($validated, $form_name, true);

			if ((string)$value === '' && $this->attrs['needed'])
			{
				self::set_validation_error($form_name,lang('Field must not be empty !!!'));
			}
			elseif (empty($this->attrs['dataformat']))	// integer timestamp
			{
				$valid = (int)$value;
			}
			// string with formatting letters like for php's date() method
			elseif (($valid = date($this->attrs['dataformat'], $value)))
			{
				// Nothing to do here
			}
			// Null is acceptable also
			elseif ($value === null)
			{
				$valid = $value;
			}
			else
			{
				// this is not really a user error, but one of the clientside engine
				self::set_validation_error($form_name,lang("'%1' is not a valid date !!!", $value).' '.$this->dataformat);
			}
		}
	}
}
new jscalendar();
