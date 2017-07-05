<?php
$cep = '01506-000';
$ch = curl_init();
$timeout = 0;
curl_setopt($ch, CURLOPT_URL, 'http://maps.google.com/maps/api/geocode/json?address=' . $cep . ',Brasil&sensor=false');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
$conteudo = curl_exec($ch);
curl_close($ch);
$output = json_decode($conteudo);
$latitude = $output->results[0]->geometry->location->lat;
$longitude = $output->results[0]->geometry->location->lng;
