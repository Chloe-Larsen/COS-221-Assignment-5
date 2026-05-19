<?php

class DatabaseConnection
{
    private $connection;

    public static function instance()
    {
        static $instance = null;
        if ($instance === null) {
            $instance = new DatabaseConnection();
        }
        return $instance;
    }

    private function __construct()
    {
        try {
            // Added charset=utf8mb4 to prevent encoding quirks
            $this->connection = new PDO(
                "mysql:host=" . $_ENV["DB_HOST"] . ";dbname=" . $_ENV["DB_NAME"] . ";charset=utf8mb4",
                $_ENV["DB_USER"],
                $_ENV["DB_PASSWORD"]
            );
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            $this->connection->setAttribute(PDO::ATTR_STRINGIFY_FETCHES, false);
            // Default to returning clean associative arrays
            $this->connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            // In production, you'd want to log this rather than echoing it out
            die("Connection failure: " . $e->getMessage());
        }
    }

    public function __destruct()
    {
        $this->connection = null; // garbage collection will close the connection
    }

    /**
     * Executes an INSERT, UPDATE, or DELETE query.
     * Returns true on success or false on failure.
     */
    public function execute(string $sql, array $params = []): bool
    {
        try {
            $stmt = $this->connection->prepare($sql);
            return $stmt->execute($params);
        } catch (PDOException $e) {
            // Handle or log the error gracefully
            throw new Exception("Database execute error: " . $e->getMessage());
        }
    }

    /**
     * Fetches a SINGLE row from a SELECT query.
     * Returns the row array, or false if no record is found.
     */
    public function fetch(string $sql, array $params = [])
    {
        try {
            $stmt = $this->connection->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetch(); // Uses default FETCH_ASSOC set in constructor
        } catch (PDOException $e) {
            throw new Exception("Database fetch error: " . $e->getMessage());
        }
    }

    /**
     * Fetches ALL rows matching a SELECT query.
     * Returns an array of rows (empty array if no records found).
     */
    public function fetchAll(string $sql, array $params = []): array
    {
        try {
            $stmt = $this->connection->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            throw new Exception("Database fetchAll error: " . $e->getMessage());
        }
    }
}

$db = DatabaseConnection::instance();