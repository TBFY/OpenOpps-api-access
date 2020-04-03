"""
Create a file called ".env" in the same directory as this file with these two lines, completed with your username/password:
API_CALL_USERNAME=""
API_CALL_PASSWORD=""
"""

import json
import os
from datetime import datetime
from os.path import dirname

import requests
from dotenv import load_dotenv, find_dotenv

load_dotenv(find_dotenv())

current_dir = dirname(os.path.realpath(__file__))
username = os.environ.get('API_CALL_USERNAME', None)
password = os.environ.get('API_CALL_PASSWORD', None)
api_url = "https://staging.openopps.com/api/tbfy/ocds/"


def get_api_token(username, password):
    data = '{"username": "%s", "password": "%s"}' % (username, password)
    headers = {"Content-Type": "application/json"}
    req = requests.post(
        "https://staging.openopps.com/api/api-token-auth/", data=data, headers=headers
    )
    token = req.json().get("token")
    return token


def make_api_call(url, token):
        """
        Makes the API call with provided url, passing in the required headers, and Content Type
        """
        headers = {'Authorization': 'JWT {}'.format(token)}
        req = requests.get(url, headers=headers)
        parsed_response = req.json()
        return parsed_response


def make_api_request():
    token = get_api_token(username, password)

    response = make_api_call(api_url, token)

    output = json.dumps(response)
    filename = datetime.now().strftime("TBFY_API_CALL_%Y-%m-%d_%H-%M-%S")
    with open(os.path.join(current_dir, filename), mode='w') as f:
        f.write(output)


if __name__ == '__main__':
    make_api_request()
