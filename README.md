# Sensitive Information Finder

`Sensitive Information Finder` is a Bash script designed to help developers and security professionals audit projects for sensitive information. It automates the process of searching for configuration files, internal IP addresses, database connections, API secrets, and other sensitive data in a specified directory.

## Features

- **Search for Configuration Files**: Identifies files commonly used for storing sensitive configurations (e.g., database credentials, API keys).
- **Detect Internal IP Addresses**: Scans PHP files for hardcoded IP addresses.
- **Identify Database Information**: Searches for database connections and keywords in PHP files.
- **Locate API Secrets**: Finds API keys, tokens, and other sensitive API-related secrets.
- **Discover Sensitive Files**: Detects files with extensions and names that often contain sensitive information, such as `.env`, `.pem`, `.json`, and `.sql`.
- **Customizable Path**: Specify the directory where the script will perform the search.

## Usage

Run the script with the desired options:

```bash
./GitPlot.sh [options]
```

### Options

| Option                   | Description                                                                         |
| ------------------------ | ----------------------------------------------------------------------------------- |
| `--search-files`         | Search for files with names related to configurations and database connections.     |
| `--search-ips`           | Search for IP addresses in PHP files.                                               |
| `--search-db-info`       | Search for database connections and sensitive keywords in PHP files.                |
| `--search-api-secrets`   | Search for API keys, tokens, and other secrets in PHP files.                        |
| `--find-sensitive-files` | Search for files that may contain sensitive information based on name or extension. |

### Examples

1. **Search for configuration files in the current directory:**
   ```bash
   ./GitPlot.sh --search-files
   ```

2. **Scan a specific directory for IP addresses:**
   ```bash
   ./GitPlot.sh --path /var/www/html --search-ips
   ```

3. **Find database credentials in a project folder:**
   ```bash
   ./GitPlot.sh --path /home/user/project --search-db-info
   ```

4. **Identify API secrets in PHP files:**
   ```bash
   ./GitPlot.sh --search-api-secrets
   ```

5. **Locate sensitive files across the system:**
   ```bash
   ./GitPlot.sh --find-sensitive-files
   ```

## Output

The script uses colored output for better readability:

- **Blue**: Indicates the search process has started.
- **Green**: Indicates the search has completed successfully.
- **Red**: Indicates an error or an unrecognized parameter.

## Prerequisites

- Bash (Unix/Linux shell environment)
- Access to the directory where the search will be performed

## Limitations

- Currently supports only PHP files for keyword-based searches.
- Does not analyze non-text-based files or perform deep behavioral analysis.
- Sensitive information detection is limited to predefined patterns and keywords.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

Created by **mr r00t**. Contributions and suggestions are welcome!
