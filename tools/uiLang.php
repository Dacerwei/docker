<?php

$keys = [
    'en',
    'ja',
    'id',
    'ko',
    'zh-cn',
    'zh-hk',
    'zh-tw'
];

$sit = new Redis();
$sit->connect('redis.sit.kkday.com', 6379);
$sit->select(0);

$local = new Redis();
$local->connect('127.0.0.1', 6379);
$local->select(0);

foreach ($keys as $redis_key) {
    $val = $sit->get("common:uiLangList:frontend:$redis_key");
    $local->set("common:uiLangList:frontend:$redis_key", $val);
    echo "common:uiLangList:frontend:$redis_key updated!\n";

    $val = $sit->get("common:uiLangList:mobileweb:$redis_key");
    $local->set("common:uiLangList:mobileweb:$redis_key", $val);
    echo "common:uiLangList:mobileweb:$redis_key updated!\n";

    $val = $sit->get("common:uiLangList:system:$redis_key");
    $local->set("common:uiLangList:system:$redis_key", $val);
    echo "common:uiLangList:system:$redis_key updated!\n";
}
