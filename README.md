<img src="doc/logo.svg">

---

# GitGuardian shield Github Action

Find exposed credentials in your commits using [gg-shield](https://github.com/GitGuardian/gg-shield).

## Installation

Add a new job to your Github workflow using the `GitGuardian/gg-shield-action` action.

```yaml
name: GitGuardian scan

on: [push, pull_request]

jobs:
  scanning:
    name: GitGuardian scan
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0 # fetch all history so multiple commits can be scanned
      - name: GitGuardian scan
        uses: GitGuardian/gg-shield-action@master
        env:
          GITHUB_PUSH_BEFORE_SHA: ${{ github.event.before }}
          GITHUB_PUSH_BASE_SHA: ${{ github.event.base }}
          GITHUB_PULL_BASE_SHA: ${{ github.event.pull_request.base.sha }}
          GITHUB_DEFAULT_BRANCH: ${{ github.event.repository.default_branch }}
          GITGUARDIAN_API_KEY: ${{ secrets.GITGUARDIAN_API_KEY }}
          GITGUARDIAN_API_URL: ${{ secrets.GITGUARDIAN_API_URL }}
```
