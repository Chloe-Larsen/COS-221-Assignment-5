<?php
/*
    Loads the variables from the .env file.
    NB: Use $_ENV["VARIABLE_NAME"] to use environment variables in this project!!
*/

function loadEnv($path)
{
    if (!file_exists($path)) {
        return false;
    }

    // read the file into an array of lines
    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

    foreach ($lines as $line) {
        // skip lines that start with a comment (#)
        if (strpos(trim($line), '#') === 0) {
            continue;
        }

        if (strpos($line, '=') !== false) {
            [$key, $value] = explode('=', $line, 2);

            // clean up whitespace and strip any enclosing quotes around the value
            $key = trim($key);
            $value = trim($value);
            $value = trim($value, '"\'');

            // put the variables into the environment and superglobals (does all 3 for compatibility)
            putenv("$key=$value");
            $_ENV[$key] = $value;
            $_SERVER[$key] = $value;
        }
    }

    return true;
}

loadEnv(__DIR__ . "/../../.env");