# Lambda function returns a greeting

import urllib
import os
import sys
import json


def lambda_handler(event, context):

    try:
        name = event['pathParameters']['name']

    except:
        return {
            'statusCode': 400,
        }

    return {
        'statusCode': 200,
        'body': json.dumps({'helloMessage': 'Hello ' + name})

    }
