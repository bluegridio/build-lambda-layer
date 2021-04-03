FROM amazonlinux

RUN yum update -y \
    && yum install zip -y \
    && yum install python3 -y \
    && python3 -m pip install --upgrade pip --target /usr/lib64/python3.7/site-packages/
   
RUN mkdir -p /python/lib/python3.7/site-packages \
    && mkdir lambda_layer

ARG package

RUN pip3 install $package -t /python/lib/python3.7/site-packages

RUN chmod -R 755 /python/lib/python3.7/site-packages \
    && zip -r /lambda_layer/$package.zip /python/lib/python3.7/site-packages


CMD ["sleep","5"]




