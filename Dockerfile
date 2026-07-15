FROM public.ecr.aws/lambda/python:3.11

COPY agent-ai/requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install -r requirements.txt

COPY agent-ai/ ${LAMBDA_TASK_ROOT}/agent-ai/
COPY AskAI_Data/ ${LAMBDA_TASK_ROOT}/AskAI_Data/

# Assuming the entry handler is server.py or similar inside agent-ai folder.
CMD [ "agent-ai.server.handler" ]
