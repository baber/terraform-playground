# Playground for terraform snippets.

## Pre-requisites

 * Make sure your AWS environment is set (either AWS_PROFILE or region and credentials separately)

## Testing

To run 'unit' tests (those that test one standalone terraform module):

`rake unitTest

To run integration tests:

`rake intTest`

To package (create a tar of all the terraform scripts in target directory):

`rake repackage`
