#!/bin/bash

# Set variables
TABLE_NAME="CbLibrary01Table"
ATTRIBUTE_DEFINITIONS='[
    { "AttributeName": "Category", "AttributeType": "S" },
    { "AttributeName": "BookID", "AttributeType": "S" },
    { "AttributeName": "Title", "AttributeType": "S" }
]'
KEY_SCHEMA='[
    { "AttributeName": "Category", "KeyType": "HASH" },
    { "AttributeName": "BookID", "KeyType": "RANGE" }
]'
BILLING_MODE="PAY_PER_REQUEST"
GLOBAL_SECONDARY_INDEXES='[
    {
        "IndexName": "CategoryIndex",
        "KeySchema": [
            { "AttributeName": "Category", "KeyType": "HASH" }
        ],
        "Projection": {
            "ProjectionType": "ALL"
        }
    },
    {
        "IndexName": "BookIndex",
        "KeySchema": [
            { "AttributeName": "BookID", "KeyType": "HASH" }
        ],
        "Projection": {
            "ProjectionType": "INCLUDE",
            "NonKeyAttributes": [ "Title", "Author", "Category" ]
        }
    },
    {
        "IndexName": "TitleCategoryIndex",
        "KeySchema": [
            { "AttributeName": "Title", "KeyType": "HASH" },
            { "AttributeName": "Category", "KeyType": "RANGE" }
        ],
        "Projection": {
            "ProjectionType": "KEYS_ONLY"
        }
    }
]'

# Create table
aws dynamodb create-table \
    --table-name "${TABLE_NAME}" \
    --attribute-definitions "${ATTRIBUTE_DEFINITIONS}" \
    --key-schema "${KEY_SCHEMA}" \
    --billing-mode "${BILLING_MODE}" \
    --global-secondary-indexes "${GLOBAL_SECONDARY_INDEXES}" \
    --endpoint-url http://0.0.0.0:8000 \
    --no-cli-pager