<?php
header('Content-Type: application/json');
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    print json_encode(['message' => 'Hello world!']);
} else {
    http_response_code(405);
    print json_encode(['error' => 'Method not allowed']);
}
?>
