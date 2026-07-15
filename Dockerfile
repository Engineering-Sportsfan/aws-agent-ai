FROM public.ecr.aws/lambda/python:3.11

COPY agent-ai/requirements.txt ${LAMBDA_TASK_ROOT}
RUN yum install -y gcc rust cargo && pip install --upgrade pip && pip install --prefer-binary -r requirements.txt

COPY agent-ai/ ${LAMBDA_TASK_ROOT}/agent-ai/

# Assuming the entry handler is server.py or similar inside agent-ai folder.
CMD [ "agent-ai.server.handler" ]
