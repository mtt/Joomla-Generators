<?php
// No direct access
defined( '_JEXEC' ) or die;
 
require_once( JPATH_COMPONENT.DS.'controller.php' );

JTable::addIncludePath(JPATH_COMPONENT.DS.'tables');

$classname    = '{COM}Controller';
$controller   = new $classname( );
$controller->execute( JRequest::getWord( 'task' ) );
 
$controller->redirect();
?>