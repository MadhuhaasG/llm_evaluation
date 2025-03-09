FROM heartexlabs/label-studio:latest

# Copy your configuration and data
COPY config.xml /label-studio/config.xml
COPY data/ /label-studio/data/

EXPOSE 8080
CMD ["label-studio", "start", "--port", "8080", "--host", "0.0.0.0"]
