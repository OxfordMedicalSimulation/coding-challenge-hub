# OMS Hub Code Challenge

Welcome to the OMS coding challenge for Rails developers.

This challenge is intended to be undertaken in real time during your technical
interview with the team. You are welcome to clone the repository and explore
the code prior to your interview.

During the interview, you will share your screen and work through the TODOs,
explaining your approach and thought process as you go. You may use the editor
of your choice (RubyMine, VS Code, Vim, etc.).

The purpose of the exercise is for candidates to demonstrate their
understanding of Rails development and to create discussion points for the
technical interview. It is considered an _open book_ exercise — looking things
up is absolutely fine.

## Prerequisites

You must have the following installed:

- Ruby `3.4.4`
- SQLite `sqlite3`

## Setup

Setup application:

```bash
bin/setup
```

## List TODOs

To identify the TODOs in the application that require attention, run:

```bash
bin/rails notes
```

This will scan the codebase (including the spec folder) for comments like
`TODO`, `FIXME`, or `OPTIMIZE`

## Run server

```bash
bin/dev
```

## Run tests

To confirm your fixes, run:

```bash
bundle exec rspec spec
```

## Interact with the API

A Postman collection is included in the project root to help you interact with
the API. Feel free to use this or any other tool you prefer.
