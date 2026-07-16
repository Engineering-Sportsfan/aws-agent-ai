FROM public.ecr.aws/lambda/python:3.11

COPY agent-ai/requirements.txt ${LAMBDA_TASK_ROOT}
RUN yum install -y gcc rust cargo && \
    pip install --upgrade pip && \
    pip install --prefer-binary -r requirements.txt && \
    yum remove -y gcc rust cargo && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY agent-ai/ ${LAMBDA_TASK_ROOT}

# The files are now directly in the root
CMD [ "server.handler" ]
