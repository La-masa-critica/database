# Use the official PostgreSQL image from the Docker Hub
FROM docker.io/library/postgres:latest

# Set environment variables
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Copy the SQL file to the Docker container
COPY db.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432

# The default command will run the PostgreSQL server