# weather_tdd

A new Flutter project.

### Unit Tessting
How can you ensure that your app continues to work as you add more features or change existing functionality? By writing tests.

Unit tests are handy for verifying the behavior of a single function, method, or class. The test package provides the core framework for writing unit tests, and the flutter_test package provides additional utilities for testing widgets.
https://docs.flutter.dev/cookbook/testing/unit/introduction

### Mock dependencies using Mockito

Sometimes, unit tests might depend on classes that fetch data from live web services or databases. This is inconvenient for a few reasons:

Calling live services or databases slows down test execution.
A passing test might start failing if a web service or database returns unexpected results. This is known as a “flaky test.”
It is difficult to test all possible success and failure scenarios by using a live web service or database.
Therefore, rather than relying on a live web service or database, you can “mock” these dependencies. Mocks allow emulating a live web service or database and return specific results depending on the situation.
https://docs.flutter.dev/cookbook/testing/unit/mocking