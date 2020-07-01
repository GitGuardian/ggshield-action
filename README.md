<a href="https://gitguardian.com/"><img src="https://cdn.jsdelivr.net/gh/gitguardian/gg-shield-action/doc/logo.svg"></a>

---

# [GitGuardian Shield](https://github.com/GitGuardian/gg-shield) GitHub Action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-v1-undefined.svg?logo=github&logoColor=white&style=for-the-badge)](https://github.com/marketplace/actions/gitguardian-shield-action)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/gitguardian/ggshield?color=1B2D55&sort=semver&style=for-the-badge&label=ggshield)](https://hub.docker.com/r/gitguardian/ggshield)
[![License](https://img.shields.io/github/license/GitGuardian/gg-shield-action?color=%231B2D55&style=for-the-badge)](LICENSE)
![GitHub stars](https://img.shields.io/github/stars/gitguardian/gg-shield-action?color=%231B2D55&style=for-the-badge)

Find exposed credentials in your commits using [**GitGuardian shield**](https://github.com/GitGuardian/gg-shield).

The **GitGuardian shield** (gg-shield) is a CLI application that runs in your local environment
or in a CI environment to help you detect more than 200 types of secrets, as well as other potential security vulnerabilities or policy breaks.

**GitGuardian shield** uses our [public API](https://api.gitguardian.com/doc) through [py-gitguardian](https://github.com/GitGuardian/py-gitguardian) to scan your files and detect potential secrets or issues in your code. **The `/v1/scan` endpoint of the [public API](https://api.gitguardian.com/doc) is stateless. We will not store any files you are sending or any secrets we have detected**.

You'll need an **API Key** from [GitGuardian](https://dashboard.gitguardian.com/api/v1/auth/user/github_login/authorize?utm_source=github&utm_medium=gg_shield&utm_campaign=shield1) to use gg-shield.

## Installation

Add a new job to your GitHub workflow using the `GitGuardian/gg-shield-action` action.

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
```

Do not forget to add your [GitGuardian API Key](https://dashboard.gitguardian.com/api/v1/auth/user/github_login/authorize?utm_source=github&utm_medium=gg_shield&utm_campaign=shield1) to the `GITGUARDIAN_API_KEY` secret in your project settings.

# License

**GitGuardian shield** is MIT licensed.
