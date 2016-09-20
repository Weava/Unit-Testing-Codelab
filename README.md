# Objective-C Unit Tests (with iOS)

Objective-C unit tests run on a framework known as XCTest ([Here's a little sample](https://developer.apple.com/reference/xctest?language=objc)).

### Getting the Project

To get the source for this project so you can start writing tests, make sure you have git installed.
In your Terminal.app type 

````
git clone https://github.com/Weava/Unit-Testing-Codelab.git
````

Once the repository has finished downloading, navigate into the newly made Unit-Testing-Codelab folder in your terminal, then enter the following:

````
git checkout -b objc
git pull origin 89a0d3e7b39be83270d2d211daacd82c3da81a03
````

This will get you the starting code with no unit tests written for the project.

With that all setup, you are now prepared to write tests!

### So Where Are Tests in My iOS Project?

You have probably seen the projectNameTest folders that XCode generates for you whenever you create a new project. These folders house all of your XCTest unit test case classes. When you first create your project and open up the generated test class they made for you (usually called projectNameTest.m) You will see something like this:

````
@interface unittestTests : XCTestCase

@end

@implementation unittestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
````

The comments in each method explain what those methods are for. Every time you create a new Unit Test Case Class in XCode, it will come with these methods pre-made.

Before we start modifying this file, let's look at the anatomy of a unit test.

Unit testing with XCTest (or most any unit testing framework for that matter) will involve three different steps:

**Arrange**, **Act**, and **Assert**

### Arrange

Arranging, in unit testing, is the act of setting up the items that you wish to eventually act upon, and setting up any dependencies that those items may rely on (this is where you will fake, mock, or do whatever to said dependencies). We might also setup any arguments we may be passing into the methods we want to call.

For example, using our `SimpleOperations` class in this project, we would do the following to arrange it.

````
SimpleOperations *operations = [[SimpleOperations alloc] init]; // Set up (Arrange) our unit to test.
````

That's it! Of course, this gets more complicated when your class has tons of dependencies, and mocks/fakes become involved, but we won't talk about that here.

### Act

Acting is just as simple as arranging, and we do it all the time in our production code. All we have to do is invoke the method we are testing, however many times we need to test for assertions (we will get to that next).

Using our `SimpleOperations` example again, we could call our add function.

````
int addResult = [operations add:2 toY:5]; // Use our add method for a result
````

Easy, right? Nothing really new was learned here, we have all called methods. This is generally how complicated acting gets, calling methods.

### Assert

Assertions are a new concept, but are super simple. In fact, their name gives it away. Assertions allow you to define a specific result for your operation that you called during the **Act** stage of the unit testing process.

Using the previous example where we assigned the value `addResult` to the result of the method `[operations add:2 toY:5]` we can assert one, and only one integer, to make this test pass.

````
XCTAssertEqual(addResult, 10, @"2 + 5 doesn't equal 10, you idiot."); // Will fail
XCTAssertEqual(addResult, 7, @"If 2 + 5 doesn't equal 7, then my entire life is a lie."); // Will succeed
````

That is assertions in a nutshell. There are plenty of other assert methods other than `XCTAssertEqual` (You can check them all out [here](https://developer.apple.com/reference/xctest?language=objc)). As you can see, assertions are just checks to see if the result of the operation you performed in the **Act** stage meets a specific output that you define. Assertions seem simple on the surface, and syntactically they are. It is deciding what to assert, and whether you are writing good testable code that is a challenge.

### Putting It All Together

Now we can put all of those examples together in one testable case. Remember the generated file we looked at earlier? Let's modify that to take in our example.

````
@interface unittestTests : XCTestCase
  @property SimpleOperations *operations;
@end

@implementation unittestTests

- (void)setUp {
    // ARRANGE
    [super setUp];
    operations = [[SimpleOperations alloc] init];
}

- (void)tearDown {
    // De-allocate objects
    [operations release];
    [super tearDown];
}

- (void)testAddition {
    // ACT
    int addResult = [operations add:2 toY:5];
    
    // ASSERT
    XCTAssertEqual(addResult, 10, @"2 + 5 doesn't equal 10, you idiot."); // Will fail
    XCTAssertEqual(addResult, 7, @"If 2 + 5 doesn't equal 7, then my entire life is a lie."); // Will succeed
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
````

Not so bad! We put `operations = [[SimpleOperations alloc] init];` In our setUp function, as that will be called before any of our test methods are called (This is our **Arrange** portion). For example, our `testAddition` method would have `setUp` be called before any of it's statements are executed. Then our `testAddition` statements execute the **Act** and **Assert** steps of our test.

### And Now, We Run It

// Insert example of running unit tests in XCode.

### Going from here

Now that you have an idea of how both unit tests, and XCTest works, let's try creating unit test methods for the rest of our `SimpleOperations` class's methods. Then we can create an entirely new test case file for our `ComplexOperations`.
