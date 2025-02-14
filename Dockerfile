# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy the Nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Start Nginx and FastAPI
CMD ["sh", "-c", "service nginx start && uvicorn main:app --host 127.0.0.1 --port 8000"]