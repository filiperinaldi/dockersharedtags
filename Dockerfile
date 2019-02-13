ARG BASE
FROM ${BASE}

ADD script.py .
CMD [ "python", "./script.py" ]
