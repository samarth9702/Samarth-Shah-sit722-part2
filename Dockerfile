ARG PYTHON_VERSION=3.10
FROM python:${PYTHON_VERSION}-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the book_catalog directory contents into the container at /app/book_catalog
COPY ./book_catalog /app/book_catalog

# Set the working directory to /app/book_catalog
WORKDIR /app/book_catalog

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 4005 available to the world outside this container
EXPOSE 4005

# Run uvicorn server on port 4005
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4005"]