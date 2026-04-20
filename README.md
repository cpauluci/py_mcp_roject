# MCP Chat

MCP Chat is a command-line interface application that enables interactive chat capabilities with AI models through the Anthropic API. The application supports document retrieval, command-based prompts, and extensible tool integrations via the MCP (Model Control Protocol) architecture.

![MCP Server Primitives](./assets/mcp_server_primitives.png)
*Reference: [Introduction to Model Context Protocol](https://anthropic.skilljar.com/introduction-to-model-context-protocol/303756)*

## Prerequisites

- Python 3.9+
- Anthropic API Key

## Setup

### Step 1: Configure the environment variables

1. Create or edit the `.env` file in the project root and verify that the following variables are set correctly:

```
ANTHROPIC_API_KEY=""  # Enter your Anthropic API secret key
```

### Step 2: Install dependencies

#### Option 1: Setup with uv (Recommended)

[uv](https://github.com/astral-sh/uv) is a fast Python package installer and resolver.

1. Install uv, if not already installed:

If you don't have Python installed, you can use the provided setup script to install `uv` standalone:
```bash
./setup_uv.sh
```
*(After running, you may need to restart your terminal or run `source $HOME/.local/bin/env`)*

Alternatively, if you already have Python and `pip`, you can install it via:
```bash
pip install uv
```

2. Create and activate a virtual environment:

```bash
uv venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

3. Install dependencies:

```bash
uv pip install -e .
```

4. Run the project

```bash
uv run main.py
```

#### Option 2: Setup without uv

1. Create and activate a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

2. Install dependencies:

```bash
pip install anthropic python-dotenv prompt-toolkit "mcp[cli]==1.8.0"
```

3. Run the project

```bash
python main.py
```

## Usage

### Basic Interaction

Simply type your message and press Enter to chat with the model.

### Document Retrieval

Use the @ symbol followed by a document ID to include document content in your query:

```
> Tell me about @deposition.md
```

### Commands

Use the / prefix to execute commands defined in the MCP server:

```
> /summarize deposition.md
```

Commands will auto-complete when you press Tab.

## Development

### Adding New Documents

Edit the `mcp_server.py` file to add new documents to the `docs` dictionary.

### Implementing MCP Features

To fully implement the MCP features:

1. Complete the TODOs in `mcp_server.py`
2. Implement the missing functionality in `mcp_client.py`

### Debugging the MCP Server and Client

If you need to debug the MCP server isolated from the main application, you can use the MCP server inspector:

```bash
uv run mcp dev mcp_server.py
```

To debug the MCP client directly, you can run `mcp_client.py` in an isolated way. First, open `mcp_client.py` and scroll to the bottom. Comment out the `pass` statement and uncomment the testing code lines, then run:

```bash
uv run mcp_client.py
```

### Linting and Typing Check

There are no lint or type checks implemented.
