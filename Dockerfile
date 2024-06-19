# Use the official Golang image as the base image
FROM golang:1.22-alpine

# Install necessary packages
RUN apk add --no-cache git

# Install Air for live reloading
RUN go install github.com/air-verse/air@latest

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Expose port 8000 to the outside world
EXPOSE 8000

# Command to run Air
CMD ["air"]
