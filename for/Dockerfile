FROM python:3.8

COPY bairscr.py /

RUN apt-get update && apt-get install -y python3-pip && pip install vk_api

CMD ["python","./bairscr.py"]


