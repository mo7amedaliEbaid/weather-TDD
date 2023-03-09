# weather_tdd

A simple project in my journey of learning Test-driven development (TDD), Tests and Clean Architecture in Flutter.

- Weather App.
- Bloc State Management.
- Unit Testing.
- Widget Testing.
- Clean Architecture.
- TDD.


### Test-driven development (TDD).

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/weather-TDD/blob/d347e3c95e1aa601b41b1493d25107ca64465786/screenshots/tdd.png" width="670" height="400" />
</p>


Test-driven development (TDD) is a software development process relying on software requirements being converted to test cases before software is fully developed, and tracking all software development by repeatedly testing the software against all test cases. This is as opposed to software being developed first and test cases created later.
<br />
Software engineer Kent Beck, who is credited with having developed or "rediscovered" the technique, stated in 2003 that TDD encourages simple designs and inspires confidence.
<br />
Test-driven development is related to the test-first programming concepts of extreme programming, begun in 1999, but more recently has created more general interest in its own right.
<br />

### Test-driven development cycle.

1. Add a test.
<br />
The adding of a new feature begins by writing a test that passes if the feature's specifications are met. The developer can discover these specifications by asking about use cases and user stories. A key benefit of test-driven development is that it makes the developer focus on requirements before writing code. This is in contrast with the usual practice, where unit tests are only written after code.
<br />
2. Run all tests. The new test should fail for expected reasons.
<br />
This shows that new code is actually needed for the desired feature. It validates that the test harness is working correctly. It rules out the possibility that the new test is flawed and will always pass.
<br />
3. Write the simplest code that passes the new test.
<br />
Inelegant or hard code is acceptable, as long as it passes the test. The code will be honed anyway in Step 5. No code should be added beyond the tested functionality.
<br />
4. All tests should now pass
<br />
If any fail, the new code must be revised until they pass. This ensures the new code meets the test requirements and does not break existing features.
<br />
5. Refactor as needed, using tests after each refactor to ensure that functionality is preserved.
<br />
Code is refactored for readability and maintainability. In particular, hard-coded test data should be removed. Running the test suite after each refactor helps ensure that no existing functionality is broken.
<br />
Examples of refactoring:
- moving code to where it most logically belongs.
- removing duplicate code.
- making names self-documenting.
- splitting methods into smaller pieces.
- re-arranging inheritance hierarchies.
<br />

### Other Related Concepts.

<br />

#### Unit Testing

<br />
How can you ensure that your app continues to work as you add more features or change existing functionality? By writing tests.
<br />
Unit tests are handy for verifying the behavior of a single function, method, or class. The test package provides the core framework for writing unit tests, and the flutter_test package provides additional utilities for testing widgets.
<br />

[Continue Reading](https://docs.flutter.dev/cookbook/testing/unit/introduction)


#### Mock dependencies using Mockito

<br />
Sometimes, unit tests might depend on classes that fetch data from live web services or databases. This is inconvenient for a few reasons:
<br />
Calling live services or databases slows down test execution.
A passing test might start failing if a web service or database returns unexpected results. This is known as a “flaky test.”
It is difficult to test all possible success and failure scenarios by using a live web service or database.
Therefore, rather than relying on a live web service or database, you can “mock” these dependencies. Mocks allow emulating a live web service or database and return specific results depending on the situation.

[Continue Reading](https://docs.flutter.dev/cookbook/testing/unit/mocking)
