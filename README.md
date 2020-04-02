# Build AWS Lambda Layers for Python runtime 

> An easy way to build AWS Lambda Layer for Python runtime.

> Solution for AWS Lambda Layer that contains cryptography library.

[AWS Lambda Layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) built on ``Mac OS`` that contain ``cryptography``packge will result in an error.
```shell
ImportError: /var/task/cryptography/hazmat/bindings/_constant_time.so: invalid ELF header
```
  ``cryptography`` contains native code and that code is compiled for the architecture of the current machine. [AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html) needs [Layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) compiled as linux ELF shared objects. 

### Prerequisites
Install [Docker](https://docs.docker.com/install/) on your local machine. 

## Installation
Clone this repo to your local machine.
```shell
$ git clone https://github.com/bluegridio/build-lambda-layer.git
$ cd build-lambda-layer
```

## Usage
Run the script and provide the package name as first argument. 
```shell
$ ./build-lambda-layer.sh curl
```

!()[http://g.recordit.co/VmPFld4WRj.gif]
