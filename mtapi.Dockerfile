FROM python:3.11-slim-buster

WORKDIR /app

# Copy requirements.txt first for caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Command to run the application using Flask's built-in development server
# Use gunicorn for production (see below)
CMD ["flask", "run", "--host=0.0.0.0"]

# --- Optional: Production-Ready Setup with Gunicorn ---
# (Replace the CMD above with the following lines)
# RUN pip install gunicorn  # Install Gunicorn
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "mtapi:app"]
