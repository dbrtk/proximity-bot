#!/usr/bin/env bash

set -e

mongo <<EOF
db = db.getSiblingDB("$DATABASE_NAME");
db.createUser({
    user: "$DATABASE_USERNAME",
    pwd: "$DATABASE_PASSWORD",
    roles: [{
        role: "readWrite", 
        db: "$DATABASE_NAME"
    }]
})
db = db.getSiblingDB("$MONGO_RPC_DATABASE");
db.createUser({
    user: "$MONGO_RPC_USER",
    pwd: "$MONGO_RPC_PASS",
    roles: [{
        role: "readWrite", 
        db: "$MONGO_RPC_DATABASE"
    }]
})
db.$MONGO_CRAWL_STATE_COLL.createIndex(
    {
        "created": 1
    }, {
        expireAfterSeconds: 3600 
    }
)
db.$MONGO_CRAWL_STATE_COLL.createIndex(
    {
        "crawlid": 1,
        "url": 1
    }, {
        unique: true
    }
)
db.$MONGO_CRAWL_RESULTS_COLL.createIndex(
    {
        "created": 1
    }, {
        expireAfterSeconds: 3600 
    }
)
EOF
