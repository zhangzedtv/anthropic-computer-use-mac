# Anthropic Claude Computer Use on Mac (optimised for Bedrock provider)

[Anthropic Computer Use](https://github.com/anthropics/anthropic-quickstarts/blob/main/computer-use-demo/README.md) is a beta Anthropic feature which runs a Docker image with Ubuntu and controls it. This fork allows you to run it natively on macOS, providing direct system control through native macOS commands and utilities.

> [!CAUTION]
> This comes with obvious risks. The Bedrock agent can control everything on your Mac. Please be careful.
> Anthropic's new Claude 3.5 Sonnet model refuses to do unsafe things like purchase items or download illegal content.

## Features

- Native macOS GUI interaction (no Docker required)
- Can accessing/opening internal/private corporate websites or systems from browser (prevented by Anthropic Computer Use)
- Screen capture using native macOS commands
- Keyboard and mouse control through cliclick
- Bedrock LLM provider support
- Streamlit-based interface
- Automatic screen resolution scaling
- File system interaction and editing capabilities

## Prerequisites

- macOS Sonoma 14.5 or later
- Python 3.12+
- Homebrew (for installing additional dependencies)
- cliclick (`brew install cliclick`) - Required for mouse and keyboard control

## Setup Instructions

1. Clone the repository and navigate to it:

```bash
git clone https://github.com/zhangzedtv/anthropic-computer-use-mac.git
cd anthropic-computer-use-mac
```

2. Create and activate a virtual environment:

```bash
python3.12 -m venv venv

    - `-m venv`: Runs the `venv` module (Python's built-in virtual environment creator)
    - First `venv` is the module name
    - Second `venv` is the directory name where the virtual environment will be created
    - This creates an isolated Python environment with its own:
    - Python interpreter
    - pip
    - Site packages directory

source venv/bin/activate

    - `source`: Runs a script in the current shell
    - `venv/bin/activate`: Path to the activation script
    - After activation:
    - Your prompt will change to show `(venv)` at the beginning
    - Python commands will use the virtual environment's Python interpreter
    - Packages installed with pip will go into the virtual environment
```

3. Run the setup script:

```bash
chmod +x setup.sh
./setup.sh
```

4. Install Python requirements:

```bash
pip install -r requirements.txt
```

## Running the Demo

### Set up your environment and Anthropic API key

1. In `.env` file add:

```
API_PROVIDER=bedrock
WIDTH=800
HEIGHT=600
DISPLAY_NUM=1
```

Set the screen dimensions (recommended: stay within XGA/WXGA resolution), and put in your key from [Anthropic Console](https://console.anthropic.com/settings/keys).

2. add your aws credentials in loop.py
```
    client = AnthropicBedrock(
        # Authenticate by either providing the keys below or use the default AWS credential providers, such as
        # using ~/.aws/credentials or the "AWS_SECRET_ACCESS_KEY" and "AWS_ACCESS_KEY_ID" environment variables.
        aws_access_key="<access key>",
        aws_secret_key="<secret key>",
        # Temporary credentials can be used with aws_session_token.
        # Read more at https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html.
        aws_session_token="<session_token>",
        # aws_region changes the aws region to which the request is made. By default, we read AWS_REGION,
        # and if that's not present, we default to us-east-1. Note that we do not read ~/.aws/config for the region.
        aws_region="us-west-2",
    )
```
3. open system settings (mac) -> Privacy & security -> screen & system audio recording -> add your terminal/IDE which running the app

4. Start the Streamlit app:

```bash
streamlit run streamlit.py
```

The interface will be available at http://localhost:8501

## Screen Size Considerations

We recommend using one of these resolutions for optimal performance:

-   XGA: 1024x768 (4:3)
-   WXGA: 1280x800 (16:10)
-   FWXGA: 1366x768 (~16:9)

Higher resolutions will be automatically scaled down to these targets to optimize model performance. You can set the resolution using environment variables:

```bash
export WIDTH=1024
export HEIGHT=768
streamlit run streamlit.py
```

> [!IMPORTANT]
> The Beta API used in this reference implementation is subject to change. Please refer to the [API release notes](https://docs.anthropic.com/en/release-notes/api) for the most up-to-date information.
