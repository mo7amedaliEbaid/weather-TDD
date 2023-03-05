# weather_tdd

A new Flutter project.


### Test-driven development (TDD).

<p float="center">
   <img src="https://github.com/mo7amedaliEbaid/weather-TDD/blob/d347e3c95e1aa601b41b1493d25107ca64465786/screenshots/tdd.png" width="270" />
</p>


Test-driven development (TDD) is a software development process relying on software requirements being converted to test cases before software is fully developed, and tracking all software development by repeatedly testing the software against all test cases. This is as opposed to software being developed first and test cases created later.
<br />
Software engineer Kent Beck, who is credited with having developed or "rediscovered" the technique, stated in 2003 that TDD encourages simple designs and inspires confidence.
<br />
Test-driven development is related to the test-first programming concepts of extreme programming, begun in 1999, but more recently has created more general interest in its own right.
<br />

#### Unit Testing
How can you ensure that your app continues to work as you add more features or change existing functionality? By writing tests.

Unit tests are handy for verifying the behavior of a single function, method, or class. The test package provides the core framework for writing unit tests, and the flutter_test package provides additional utilities for testing widgets.
https://docs.flutter.dev/cookbook/testing/unit/introduction

#### Mock dependencies using Mockito

Sometimes, unit tests might depend on classes that fetch data from live web services or databases. This is inconvenient for a few reasons:

Calling live services or databases slows down test execution.
A passing test might start failing if a web service or database returns unexpected results. This is known as a “flaky test.”
It is difficult to test all possible success and failure scenarios by using a live web service or database.
Therefore, rather than relying on a live web service or database, you can “mock” these dependencies. Mocks allow emulating a live web service or database and return specific results depending on the situation.
https://docs.flutter.dev/cookbook/testing/unit/mocking