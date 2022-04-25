#!/bin/bash

earthly --platform=linux/amd64 +run --file_name=$1
