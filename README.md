# Decaf Sucks

A fresh rebuild of decafsucks.com, built on a hybrid Hanami/dry-rb/rom-rb stack.

## Requirements

For developmeent, the app requires:

- Postgres with PostGIS enabled
- [overmind](https://github.com/DarthSim/overmind) to launch system services and app processes (install with `brew install tmux overmind`)

## Installation

After cloning, run:

```
./bin/bootstrap
```

## Running system services

To start the system services, run:

```
./bin/services
```

This must be running before completing the following steps.

## Setup

To set up for the first time, run:

```
./bin/setup
```

## After pulling changes

After pulling changes from the remote, run:

```
./bin/update
```

This will install any new dependencies and run any migrations.

## Running the app

After updating, run:

```
./bin/server
```
