<?php

use Slim\Http\Request;
use Slim\Http\Response;

// Routes



$app->get('/elote', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'elote.phtml', $args);
});

$app->get('/panqueques', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'panqueques.phtml', $args);
});
