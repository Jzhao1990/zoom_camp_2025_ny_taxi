# Use Python base image
FROM python:3.9-slim

# Set environment variable to ensure outputs are unbuffered
ENV PYTHONUNBUFFERED=1

# Install system dependencies required for DBT and PostgreSQL
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install DBT and dbt-postgres adapter
RUN pip install dbt
RUN pip install dbt-postgres
RUN apt-get update && apt-get install -y git


# Set the working directory for your app
WORKDIR /app

# Default command (this can be overridden at runtime)
CMD ["dbt", "--help"]
