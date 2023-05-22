# Cloud engineer challenge

Welcome to the KI cloud engineer challenge.
We want to feel your "devops" skiils!

## Calculator application

The calculator application uses a micro service architecture to provide an API to resolve mathematical expressions.

The calculator API exposes a single endpoint, a `POST` method on the `/` root url.
This endpoint receives an expression in the form of JSON:

Expression example:

```
curl -XPOST -H 'Authentication: Bearer binary-example' -H 'Content-Type: application/json' localhost:3000/ -d '{
    "type": "addition",
    "left": 6,
    "right": 1
}'
```

Expressions can be nested:

```
curl -XPOST -H 'Authentication: Bearer nested-example' -H 'Content-Type: application/json' localhost:3000/ -d '{
    "type": "addition",
    "left": {
       "type": "addition",
       "left": 6,
       "right": 1
    },
    "right": {
        "type": "subtraction",
        "left": {
            "type": "addition",
            "left": 6,
            "right": 1
        },
        "right": 1
    }
}'
```

The `calculator` micro service is the gateway where all calculator requests should be done.
The `calculator` service does not solve any expression by it self, it relies on a set of micro services to solve expressions.
There is one micro service per expression, all micro services only expose one endpoint, a `POST` method on the `/` root url and they expect an JSON expression with a numeric `left` and `right` operands.
The `calculator` service is responsible for navigating the expression nodes in such a way that it only calls the expression micro services only with number parameters.

The available mathematical expression micro services are:

-   `addition`:
    Returns a value object with the result of adding both operands.
-   `subtraction`:
    Returns a value object with the result of subtracting the `right` operand from the `left` one.
-   `multiplication`:
    Returns a value object with the result of multiplying both operands.
-   `division`:
    Returns a value object with the result of dividing the `left` by the `right` operand.
-   `remainder`:
    Returns a value object with the result of the remainder of dividing the `left` by the `right` operand.

**Note**:
"kilabs/cloud-engineer-challenge-calculator:latest" image is build from services/base/dockerfile

## Challenge 1. Debug skills

In the root of the project you have a docker-compose that brings all services up.
As you may notice the client service is not working properly and is throwing an error.
We need you to fix it!

*A: I have found out that a Bearer was missed in the client/config.json. Also I've found that sometimes in some operation returned wrong values either on left either on right operands. I could not go deeper in nodejs to implement a better solution but I placed a try/catch statement in order to avoid the exit process.*

## Challenge 2. Development flow

The team is complaining that confusing to have lots of incomplete work commit to master and it's hard to track what code is in what environment.
Can you come up with a strategy to solve this issue?

*A: Actually everyone committing in the master branch isn't a good practice. What I would suggest to improve organization of these processes as of my experience is the following:*

- ***Branches:** We could encourage the use of different types of branches by developers. Each developer should create a different branch for individual tasks, allowing them to work independently without affecting the master branch. Of course commit in the master branch is denied from then on. I would suggest also having these namings convention of individual branches:*
  - ***feature**/issue-number-followed-by-short-description -> introduces a new feature to the codebase*
  - ***fix** or **bug**/issue-number-followed-by-short-description --> Bugs which need to be fixed soon.*
  - ***development** --> This branch would accumulate all features or bug fixes on which developers would merge onto it after a Pull Request being approved.*
  - ***tests** --> This branch would accumulate all features or bug fixes for tests purposes if it's the case. A pull request should be create in order to merge the code into development branch. Doing that we can guarantee that every feature or bug fix is tested before going to development branch. This branch also would trigger tests for the application.*
- ***Pull Requests and Code Reviews:** After the developer finish its work, a PR should be opened in order to the developer's work be reviewed by peers. The goal of PRs is to merge the code into another higher branch layer ie. development. This promote collaboration, catch errors, and maintaining code quality and all team members can learn from it.*
- ***Continuous Integration and Testing set:** Through a CI pipeline, we can have automate builds, tests and deploys from branches to dedicated testing environments. This would allow developers to validate their changes and catch any issue earlier.*
- ***Environment Promotions:** We could establish a controlled promotion process. For example: Once a feature branch passes all tests in the CI pipeline, it can be promoted to higher-level testing environments (e.g., staging or pre-production) before reaching the production environment. Each environment should closely resemble the production environment to catch any potential issues early.*
- ***Versioning and Tagging:** We could use versioning tag in order to identify the code that is deployed to different environments.*
- ***Infrastructure as Code:** Not forgetting to mention that we should use IaC to manage and version the infrastructure configurations. This ensures that the environment setups are consistent across different stages and can be easily replicated.*
- ***Release Management:** If not exists in the company, a release process would be welcome. We should coordinate scheduled releases for the deployment to production. We also should communicate changes to the client or staff managers.*
- ***Documentation and Communication:** We should encourage clear documentation and communication though the team. Im my previous experience we used Confluence to document the infra-structure. We also used wiki practice where developers could contribute with the current state of code in each environment, including details about ongoing work, upcoming changes, architectural designs and known issues.*
- ***Monitoring and Alerting:** This is not directly related to the flow itself but this would help us identify any issues that may arise due to incomplete or faulty code deployments.*

*In my point of view, with these strategies, we can achieve better code organization, reduce conflicts, improve visibility into the state of code in different environments, and enhance collaboration among team members.*

## Challenge 3. Test the application before deployment

At KI, all our code needs to be properly tested. If you take a look to the services, you have a folder called test where we are doing some unit tests using mocha (https://mochajs.org/)

We need you to implement a CI system to test it.
Choose one system, travis-ci, gitlab-ci, circleci... whatever you want and make the necessary change to have a proper Git and CI flow.

*A: As I have experience in Github actions, I have implemented it. We can see it in .github/workflows folder*

## Challenge 4. Deploy it to kubernetes

At this point you should have a proper flow going. but something is missing.......right we need to deploy it.
Please create a script with whatever tools you which to deploy the app to a Kubernetes cluster.

## Challenge 5: Create infrastructure

Now is the part that we will need you to deploy this system.
As a good cloud engineer you will do an automated and reproducible solution taking advantages of infrastructure as code solutions. We would prefer if you use a cloud agnostic solution target whatever cloud provider you prefer.

(note: since testing this solution may incur some costs, we will ignore errors that might come from not testing/running the script)

## Bonus

-   Update your CI to also do CD
