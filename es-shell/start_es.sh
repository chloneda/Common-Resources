#!/bin/bash

export ES_HOME=xxx

su elastic -c "sh ${ES_HOME}/bin/elasticsearch -d -p ${ES_HOME}/pid"