FROM centos:7
RUN yum update -y && yum install -y less vim
ARG UID=1000
ARG GID=1000
RUN groupadd --gid $GID boto3
RUN useradd --uid $UID --gid $GID -m -d /home/boto3 -s /bin/bash boto3
COPY requirements.txt /tmp/
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o get-pip.py && python get-pip.py && pip install --upgrade pip setuptools && pip install -r /tmp/requirements.txt
VOLUME ["/home/boto3"]
CMD ["/bin/bash"]
