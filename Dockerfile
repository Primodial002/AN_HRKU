# Stage 1: Build stage
FROM python:3.11-slim-bullseye AS builder

WORKDIR /usr/src/app

# Install uv (Python package installer)
RUN pip install uv

# Create a virtual environment
RUN uv venv

# Copy requirements and install dependencies
COPY requirements.txt .
RUN . .venv/bin/activate && uv pip install --no-cache-dir -r requirements.txt

# Stage 2: Final stage
FROM python:3.11-slim-bullseye

WORKDIR /usr/src/app

# Copy virtual environment from builder stage
COPY --from=builder /usr/src/app/.venv /.venv

# Copy the rest of the application code
COPY . .

# Make start.sh executable
RUN chmod +x start.sh

# Set the entrypoint
CMD ["bash", "start.sh"]
