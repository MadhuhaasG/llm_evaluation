FROM heartexlabs/label-studio:latest

# Set environment variables
ENV LABEL_STUDIO_HOST=0.0.0.0
ENV LABEL_STUDIO_PORT=8080
ENV LABEL_STUDIO_NO_BROWSER=true

# Copy your configuration and data
COPY config.xml /label-studio/config.xml
COPY data/ /label-studio/data/

# Expose the port
EXPOSE 8080

# Start Label Studio
CMD ["label-studio", "start", "--port", "8080", "--host", "0.0.0.0", "--no-browser"]
