#!/bin/bash

TABLE_NAME="CbLibrary01Table"

ITEMS=$(cat <<EOF
{
        "CbLibrary01Table": [
            {
                "PutRequest": {
                    "Item": {
                        "Category": {"S": "History"},
                        "BookID": {"S": "B0002"},
                        "Title": {"S": "A People's History of the United States"},
                        "Author": {"S": "Howard Zinn"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Category": {"S": "Science Fiction"},
                        "BookID": {"S": "B0003"},
                        "Title": {"S": "Dune"},
                        "Author": {"S": "Frank Herbert"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Category": {"S": "Science Fiction"},
                        "BookID": {"S": "B0004"},
                        "Title": {"S": "Neuromancer"},
                        "Author": {"S": "William Gibson"}
                    }
                }
            },
            {    "PutRequest": {
                    "Item": {
                        "Category": {"S": "Science Fiction"},
                        "BookID": {"S": "B0005"},
                        "Title": {"S": "The Left Hand of Darkness"},
                        "Author": {"S": "Ursula K. Le Guin"}
                    }
                }
            },
            {    "PutRequest": {
                    "Item": {
                        "Category": {"S": "History"},
                        "BookID": {"S": "B0006"},
                        "Title": {"S": "The Guns of August"},
                        "Author": {"S": "Cuentos de la selva"}
                    }
                }
            }
        ]
}
EOF
)

# Insert additional sample data
aws dynamodb batch-write-item \
  --request-items "${ITEMS}" \
  --endpoint-url "http://localhost:8000" \
  --no-cli-pager
