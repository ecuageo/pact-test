# Scala Pact Provider example

[Pact documentation](https://docs.pact.io/)
[Scala Pact](https://github.com/ITV/scala-pact)

## Setup

### build.sbt and sbt plugins

* add `"com.itv" %% "scalapact-scalatest" % "2.1.2"` as a `libraryDependencies` in your `build.sbt` file
* add `addSbtPlugin("com.itv.plugins" % "scalapact-plugin" % "2.0.0")` in your `project/plugins.sbt` file

### pacts import

You'll need the pacts from your consumers in a reachable location. See [Pack Broker](https://github.com/bethesque/pact_broker)

### verfying consumer pacts

* start your server `sbt run`
* run `pact-verify` with `sbt 'pact-verify --port PORT --source PATH_TO_PACT_FOLDER'`

### sample passing run

```
provider-service$ sbt 'pact-verify --port 9000 --source /Users/george.south/test/pact-test/zoo/spec/pacts/'
[info] Loading project definition from /Users/george.south/test/pact-test/scanimal-service/project
[info] Set current project to basic (in build file:/Users/george.south/test/pact-test/scanimal-service/)
*************************************
** ScalaPact: Running Verifier     **
*************************************
Attempting to use local pact files at: '/Users/george.south/test/pact-test/zoo/spec/pacts/'
Looking for pact files in: /Users/george.south/test/pact-test/zoo/spec/pacts/
Found directory: /Users/george.south/test/pact-test/zoo/spec/pacts
Loading pact file: zoo_app-animal_service.json
Verifying against 'localhost', port '9000'

Results for pact between Zoo App and Animal Service
 - [  OK  ] a request for an alligator
```
