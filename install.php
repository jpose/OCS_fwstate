<?php
function plugin_version_fwstate()
{
return array('name' => 'fwstate',
'version' => '1.0',
'author'=> 'Jeremy POSE',
'license' => 'GPLv2',
'verMinOcs' => '2.2');
}

function plugin_init_fwstate()
{
	
$object = new plugins;
$object -> add_cd_entry("fwstate","other");

//table creation
include 'sql/fwstate.php';

}

function plugin_delete_fwstate()
{
$object = new plugins;
$object -> del_cd_entry("fwstate");
}

?>