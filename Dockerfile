# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 8501 for the Streamlit web application
EXPOSE 8501

# Set the container's entrypoint to run the Streamlit app
ENTRYPOINT ["streamlit", "run", "app/data_process_db.py"]
