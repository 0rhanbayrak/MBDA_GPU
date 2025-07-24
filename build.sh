# Optional: Remove previous image
docker rmi basejupyter_mbda_gpu:latest

# Build new image
docker build -t basejupyter_mbda_gpu:latest .
