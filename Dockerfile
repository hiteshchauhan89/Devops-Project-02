# Use an official lightweight web server image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove the default nginx website
RUN rm -rf ./*

# Copy website files into the container
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
