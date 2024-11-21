#!/bin/bash
source venv/bin/activate
export PYTHONPATH=$PYTHONPATH:$(pwd)

echo "Virtual environment activated!"
echo ""
echo "To start the application:"
echo "1. Set display dimensions (recommended):"
echo "   export WIDTH=1280"
echo "   export HEIGHT=800"
echo "2. Run the Streamlit app:"
echo "   streamlit run streamlit.py"
