# confluence-cli

Command line interface for Atlassian Confluence.

## Installation

```bash
brew install envoy/tools/confluence-cli
```

## Usage

The CLI requires environment variables for authentication:
- `CONFLUENCE_BASEURL`: The base URL of your Confluence instance
- `CONFLUENCE_API_TOKEN`: Your Confluence API token

Example commands:
```bash
# View your user information
confluence me

# List pages in a space
confluence page list --space-key "MYSPACE"

# Create a new page
confluence page create --title "My Page" --space-key "MYSPACE"

# Search for content
confluence search "search term"
```

## Configuration

The CLI can be configured using environment variables or through the interactive setup:

```bash
confluence init
```