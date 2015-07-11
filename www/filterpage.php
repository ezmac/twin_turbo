<?php
error_reporting(E_ALL);
ini_set('display_errors','on');

require 'vendor/autoload.php';

$file = $_SERVER['BASEDIR'].$_SERVER['REQUESTSCRIPT'];
$html = file_get_contents($file,false);

/*
$html = file_get_dom($file);
$pro_data=$html($_GET['_pjax'])->children();
for ($i = 0; $i < $pro_data->childCount(); $i++) {
  echo $pro_data->getChild($i)->html();
}
 */
$dom = pQuery::parseStr($html);

echo $dom->query($_GET['_pjax'])->html();


?>
