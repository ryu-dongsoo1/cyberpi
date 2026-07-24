FROM python:3.10-slim

WORKDIR /app

# Install system dependencies for Pillow and ffmpeg (for yt-dlp)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
