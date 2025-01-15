 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-salesforce)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-salesforce&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-salesforce)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-salesforce&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-salesforce)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)
# iris-salesforce
This is an Interoperability Adapter for Salesforce

## Description
This app is able to:
* Query salesforce data using Salesforce Object Query Language (SOQL)
* Get a record by id
* Delete a record by id
* Update a record
* Create a record using JSON

## Usage
Start a new dev repository with InterSystems IRIS using this one as a template.
Once you clone the new repo to your laptop and open VSCode (with the [InterSystems ObjectScript Extension Pack](https://marketplace.visualstudio.com/items?itemName=intersystems-community.objectscript-pack) installed) you'll be able to start development immediately.

## Installation: ZPM

Open any IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
USER>zpm "install iris-salesforce"

## Installation: Docker

Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/iris-salesforce.git
```

Open the terminal in this directory and call the command to build and run InterSystems IRIS in container:
*Note: Users running containers on a Linux CLI, should use "docker compose" instead of "docker-compose"*
*See [Install the Compose plugin](https://docs.docker.com/compose/install/linux/)*


```
$ docker-compose up -d
```

To open IRIS Terminal do:

```
$ docker-compose exec iris iris session iris -U IRISAPP
IRISAPP>
```

To exit the terminal, do any of the following:

```
Enter HALT or H (not case-sensitive)
```

## How to use it

1. Create a json file with salesforce credentials parameters and save into your IRIS server:

{
    "instance": "[YOUR_INSTANCE].my.salesforce.com",
    "clientId": "[YOUR OAUTH CLIENT ID]",
    "clientSecret": "[YOUR OAUTH CLIENT SECRET]",
    "username": "[YOUR SALESFORCE USERNAME]",
    "password": "[YOUR SALESFORCE PASSWORD]"
}

2. Create a new Interoperability production:

3. 