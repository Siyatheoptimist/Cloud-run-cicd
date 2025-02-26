# Use the official Python image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy dependencies and install them
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose the port used by Cloud Run
EXPOSE 8080

# Start the application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
