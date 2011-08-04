<?php
 
// No direct access
 
defined( '_JEXEC' ) or die;
 
jimport('joomla.application.component.controller');
 

class {COM}Controller extends JController
{
    /**
     * Method to display the view
     *
     * @access    public
     */
    function display()
    {	
	    $view = JRequest::getVar('view');
	    if (empty($view)) {
	      JRequest::setVar( 'view', 'default'  );
        }
        parent::display();
    }
 
}
?>