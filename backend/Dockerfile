# Stage 1: Build stage🎤 imagine 
FROM python:3.10-slim AS builder

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory 
WORKDIR /app


# Install the dependencies demo install
COPY requirements.txt . 
RUN pip install --no-cache-dir --upgrade pip
RUN pip install  -r requirements.txt

# Copy the rest of the application code
COPY app.py /app

# Stage 2: Runtime stage
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /app /app
COPY . /app

# Expose the port the app runs on
EXPOSE 8080 

# Run the application
CMD ["uvicorn", "app:app",  "--port", "8080"]