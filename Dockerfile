FROM python:3.12

RUN pip install uv

CMD ["echo", "hello world!"]