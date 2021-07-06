# GitHub Actions for Okteto Cloud

## Automate your development workflows using Github Actions and Okteto Cloud
GitHub Actions gives you the flexibility to build an automated software development workflows. With GitHub Actions for Okteto Cloud you can create workflows to build, deploy and update your applications in [Okteto Cloud](https://cloud.okteto.com).

Get started today with a [free Okteto Cloud account](https://cloud.okteto.com)!

## Github Action for Deleting a Preview environment in Okteto Cloud

You can use this action to delete a preview environment in Okteto Cloud as part of your automated development workflow.

## Inputs

### `name`

**Required**  The name of the Okteto preview environment to delete.

> Remember that the preview environment name must have your github ID as a suffix.

## Example usage

This example runs the login action and then deletes a preview environment.

```yaml
# File: .github/workflows/workflow.yml
on: [push]

name: example

jobs:

  devflow:
    runs-on: ubuntu-latest
    steps:
    
    - uses: okteto/login@master
      with:
        token: ${{ secrets.OKTETO_TOKEN }}
    
    - name: "Delete the previews preview environment"
      uses: okteto/destroy-preview@master
      with:
        name: dev-previews-cindylopez
```
