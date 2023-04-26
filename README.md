# Scan your Solidity files with TMScanner

Using this GitHub Action, scan your Solidity files to detects bugs, vulnerabilities and code issues.

[TMScanner](https://prod.tmscanner.info.net) is the solution to all your scanning needs.

## Requirements

* Have an account on TMScanner. [Sign up](https://prod.tmscanner.info.net/signUp) if it's not already the case
* You have a valid token in the TMScanner system.
* You have already created a repository and have the repository id
* There is at least one .sol file in the repository where you will setup this github action

## Usage

Enable a workflow in the repository that contains your .sol files, usually declared in `.github/workflows/build.yml`. And edit it to look like:

```yaml
on:
  # Trigger analysis when pushing in "main" branch. Change this to another branch if you need to
  push:
    branches:
      - main
name: TMScanner Workflow
jobs:
  tmscan:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
      with:
        fetch-depth: 0
    - name: TMScanner Scan
      uses: htpata/tmscanner-github-action@main
      with:
        # All arguments are required
        # TM_URL: URL of the TMScanner system assigned to you by the TMScanner team (in this example: http://129.148.26.53:6862)
        # TM_REPOSITORY_ID: Use an already existing repository id in the TMScanner system (in this example: 120)
        # TM_SOURCE: The .sol file (or .zip with many .sol files inside) that you want to analyze (in this example: hello.sol)        
        TM_URL: http://129.148.26.53:6862
        TM_REPOSITORY_ID: 120
        TM_SOURCE: hello.sol
      env:
        # All env variables are required
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        TM_TOKEN: ${{ secrets.TM_TOKEN }}
```

### Secrets

- `TM_TOKEN` – This is the token used to authenticate access to TMScanner. You can set a Github action secret in the "Secrets" settings page of your repository.
- *`GITHUB_TOKEN` – Provided by Github (see [Authenticating with the GITHUB_TOKEN](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/authenticating-with-the-github_token)).*


## Have question or feedback?

To provide feedback (requesting a feature or reporting a bug) please post on the [TMScanner contact page](https://prod.tmscanner.info.net/contactUs)