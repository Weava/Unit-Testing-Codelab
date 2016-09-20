# Objective-C Unit Tests (with iOS)

Objective-C unit tests run on a framework known as XCTest ([Here's a little sample](https://developer.apple.com/reference/xctest?language=objc)).

Unit testing with XCTest (or most any unit testing framework for that matter) will involve three different steps:

**Arrange**, **Act**, and **Assert**

#### Arrange

Arranging, in unit testing, is the act of setting up the items that you wish to eventually act upon, and setting up any dependencies that those items may rely on (this is where you will fake, mock, or do whatever to said dependencies). We might also setup any arguments we may be passing into the methods we want to call.

For example, using our `SimpleOperations` class in this project, we would do the following to arrange it.

`SimpleOperations *operations = [[SimpleOperations alloc] init];`

That's it! Of course, this gets more complicated when your class has tons of dependencies, and mocks/fakes become involved, but we won't talk about that here.

#### Act

Acting is just as simple as arranging, and we do it all the time in our production code. All we have to do is invoke the method we are testing, however many times we need to test for assertions (we will get to that next).

Using our `SimpleOperations` example again, we could call our add function.

`int addResult = [operations add:2 toY:5];`

Easy, right? Nothing really new was learned here, we have all called methods. This is generally how complicated acting gets, calling methods.

#### Assert

Assertions are a new concept, but are super simple. In fact, their name gives it away. Assertions allow you to define a specific result for your operation that you called during the **Act** stage of the unit testing process.

Using the previous example where we assigned the value `addResult` to the result of the method `[operations add:2 toY:5]` we can assert one, and only one integer, to make this test pass.

````
XCTAssertEqual(addResult, 10, @"2 + 5 doesn't equal 10, you idiot."); // Will fail
XCTAssertEqual(addResult, 7, @"If 2 + 5 doesn't equal 7, then my entire life is a lie."); // Will succeed
````

That is assertions in a nutshell. There are plenty of other assert methods other than `XCTAssertEqual` (You can check them all out [here](https://developer.apple.com/reference/xctest?language=objc)). As you can see, assertions are just checks to see if the result of the operation you performed in the **Act** stage meets a specific output that you define. Assertions seem simple on the surface, and syntactically they are. It is deciding what to assert, and whether you are writing good testable code that is a challenge.
