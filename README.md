# COS221 Tripistry Group Project

Team name: `Laggage`

Team members:
- Caleb Jennings, u25173805
- Chloe Larsen, u25004141
- *Add your name here! (im too lazy 👉👈)*
- *Add your name here! (im too lazy 👉👈)*
- *Add your name here! (im too lazy 👉👈)*

## Getting Started

Here is how to get the app running on your local environment:

1. Create a `.env` file in the project root and include the required variables (see below).
2. Configure XAMPP Apache server to point to the `/public` directory.
3. Start the XAMPP Apache server.
4. Open `http://localhost` in your browser.

## Environment Variables

Must be included inside the `.env` file in the root of the project.

- `DB_HOST`
- `DB_NAME`
- `DB_USER`
- `DB_PASSWORD`

## Backend Flow

Here is how requests to the server are handled:

1. Browser makes request to backend.
2. Request is forwarded to `index.php`.
3. If the request path starts with `/api` then the request is forwarded to `api-handler.php` (using a `require_once`). Otherwise, the request is forwarded to `view-handler.php`.

### `api-handler.php`

4. Maps the path to an API endpoint handler.

*Summary:* `index > API handler > API endpoint handler`

### `view-handler.php`

4. Checks that the method is `GET`.
5. Includes data needed to render buttons based on login state (like log in, sign up and log out buttons).
6. Maps the path to a view (actual page html) or a controller to render the page (a controller is just a file that gets some data that the view needs before rendering the view).

*Summary:* `index > view handler > view` **OR** `index > view handler > view controller > view`
