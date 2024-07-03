# Use an official Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install all packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Make port 8080 available outside this container
EXPOSE 8080

# Run gunicorn with the specified configuration file
CMD ["gunicorn", "-c", "gunicorn_config.py", "app:app"]

