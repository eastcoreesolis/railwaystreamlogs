#!/usr/bin/env python3

import subprocess
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, filename='railway_logs.txt', filemode='w',
                    format='%(asctime)s - %(levelname)s - %(message)s')

# Create a logger instance
logger = logging.getLogger('RailwayLogger')

# Stream logs to both console and file
console_handler = logging.StreamHandler()
file_handler = logging.FileHandler('railway_logs.txt')
logger.addHandler(console_handler)
logger.addHandler(file_handler)

# Command to stream logs from Railway app deployment
command = "railway logs -d"  

# Start streaming logs
process = subprocess.Popen(command.split(), stdout=subprocess.PIPE, universal_newlines=True)

# Read logs from the process output and stream to file and console
for log in process.stdout:
    log = log.strip()
    logger.info(log)

# Close the process and log file handlers
process.stdout.close()
process.wait()
logging.shutdown()
