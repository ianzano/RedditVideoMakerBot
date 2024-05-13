FROM python:3.10.9-slim

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN apt update && \
    apt install -y ffmpeg python3-pip && \
    pip install -r requirements.txt && \
    playwright install-deps && \
    playwright install

# tricks for pytube : https://github.com/elebumm/RedditVideoMakerBot/issues/142 
# (NOTE : This is no longer useful since pytube was removed from the dependencies)
# RUN sed -i 's/re.compile(r"^\\w+\\W")/re.compile(r"^\\$*\\w+\\W")/' /usr/local/lib/python3.8/dist-packages/pytube/cipher.py

CMD ["python3", "main.py"]
