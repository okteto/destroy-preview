# GitHub Actions for Okteto Cloud

## Automate your development workflows using Github Actions and Okteto Cloud

GitHub Actions gives you the flexibility to build an automated software development workflows. With GitHub Actions for Okteto Cloud you can create workflows to build, deploy and update your applications in [Okteto Cloud](https://cloud.okteto.com). Follow [this tutorial](https://okteto.com/docs/cloud/preview-environments/preview-environments-github/) for a full preview environment configuration sample.

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
    
    - name: "Destroy the preview environment"
      uses: okteto/destroy-preview@master
      with:
        name: dev-previews-cindylopez
```


## Advanced usage

 ### Custom Certification Authorities or Self-signed certificates

 You can specify a custom certificate authority or a self-signed certificate by setting the `OKTETO_CA_CERT` environment variable. When this variable is set, the action will install the certificate in the container, and then execute the action. 

 Use this option if you're using a private Certificate Authority or a self-signed certificate in your [Okteto Enterprise](http://okteto.com/enterprise) instance.  We recommend that you store the certificate as an [encrypted secret](https://docs.github.com/en/actions/reference/encrypted-secrets), and that you define the environment variable for the entire job, instead of doing it on every step.


 ```yaml
 # File: .github/workflows/workflow.yml
 on: [push]

 name: example

 jobs:
   devflow:
     runs-on: ubuntu-latest
     env:
       OKTETO_CA_CERT: ${{ secrets.OKTETO_CA_CERT }}

     steps:
     - name: "Destroy the preview environment"
       uses: okteto/destroy-preview@master
       env:
         OKTETO_URL: https://cloud.okteto.com
         OKTETO_TOKEN: ${{ secrets.OKTETO_TOKEN }}
      with:
         name: dev-previews-cindylopez
```