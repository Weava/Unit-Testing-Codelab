# Objective-C Unit Tests (with iOS)

Objective-C unit tests run on a framework known as XCTest ([Here's a little sample](https://developer.apple.com/reference/xctest?language=objc)).

Unit testing with XCTest (or most any unit testing framework for that matter) will involve three different steps:

**Arrange**, **Act**, and **Assert**

#### Arrange

Arranging, in unit testing, is the act of setting up the items that you wish to eventually act upon, and setting up any dependencies that those items may rely on (this is where you will fake, mock, or do whatever to said dependencies).

For example, using our `SimpleOperations` class in this project, we would do the following to arrange it.

`SimpleOperations operations = [[SimpleOperations alloc] init];`

That's it! Of course, this gets more complicated when your class has tons of dependencies, and mocks/fakes become involved, but we won't talk about that here.
