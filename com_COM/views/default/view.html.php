<?php
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.view');



class {COM}ViewDefault extends JView
{
    function display($tpl = null)
    {
      $view = JRequest::getVar('task');
      $this->current_user =& JFactory::getUser();
      $this->assignRef( 'current_user', $this->current_user );

      if (empty($view)) {
	      $this->_layout = 'index';
	      $this->index();
	  } else {
		  $this->_layout = $view;
	      $this->$view();
	  }

	  parent::display($tpl);
    }

    function index(){
    }
}
?>