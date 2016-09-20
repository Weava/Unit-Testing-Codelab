# C# Unit Testing Codelab

C# unit tests run on a framework known, creatively, as the Microsoft Unit Testing Framework ([Here's a little sample](https://developer.apple.com/reference/xctest?language=objc)).

### Getting the Project

To get the source for this project so you can start writing tests, make sure you have git installed.
In your Terminal.app type 

````
git clone https://github.com/Weava/Unit-Testing-Codelab.git
````

Once the repository has finished downloading, navigate into the newly made Unit-Testing-Codelab folder in your terminal, then enter the following:

````
git checkout -f startCSharp
````

This will get you the starting code with no unit tests written for the project.

With that all setup, you are now prepared to write tests!

### So Where Are Tests in My .Net Project?

By default, Visual Studio does not generate a unit testing project. Adding a unit testing project to your solution is simple, just follow these steps.

* In the project explorer window, right click on your solution. 
* Hover over add, and click add new project. 
* On the left side of the newly opened dialog box, you will be looking for the option that says test. 
* Choose Unit Test Project and give your test project a name (usually going to be your projectName + Test). 

Visual studio will now generate your unit test project.

By default, A file will be generated that looks similar to this

````
namespace CodelabTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1
        {
        
        }
    }
}
````

There isn't really much here. I'm going to add a few methods that will give us a little more functionality for when we actually write our tests.

````
namespace CodelabTests
{
    [TestClass]
    public class UnitTest1
    {
    
        [TestInitialize]
        public void SetUp()
        {
            // Perform pre-test setup and initialization of necessary dependencies here
        }
    
        [TestMethod]
        public void TestMethod1()
        {
            // Perform a test here and assert its results
        }
        
        [TestCleanup]
        public void TearDown()
        {
            // Perform post-test cleanup. Is called after every test case.
        }
    }
}
````

That's a little bit better. The new methods I added `SetUp` and `TearDown` Are called before and after each `[TestMethod]` is run respectively. We will talk more about what purpose each of these functions serve below.

For now, let's take a look at the actual makeup of a unit test.

Unit testing will generally involve three steps

**Arrange**, **Act**, and **Assert**

### Arrange

Arranging, in unit testing, is the act of setting up the items that you wish to eventually act upon, and setting up any dependencies that those items may rely on (this is where you will fake, mock, or do whatever to said dependencies). We might also setup any arguments we may be passing into the methods we want to call.

For example, using our `SimpleOperations` class in this project, we would do the following to arrange it.

````
SimpleOperations operations = new SimpleOperations(); // Set up (Arrange) our unit to test
````

That's it! Of course, this gets more complicated when your class has tons of dependencies, and mocks/fakes become involved, but we won't talk about that here.

### Act

Acting is just as simple as arranging, and we do it all the time in our production code. All we have to do is invoke the method we are testing, however many times we need to test for assertions (we will get to that next).

Using our `SimpleOperations` example again, we could call our add function.

````
var addResult = operations.add(2, 5); // User our add method for a result
````

Easy, right? Nothing really new was learned here, we have all called methods. This is generally how complicated acting gets, calling methods.

### Assert

Assertions are a new concept, but are super simple. In fact, their name gives it away. Assertions allow you to define a specific result for your operation that you called during the **Act** stage of the unit testing process.

Using the previous example where we assigned the value addResult to the result of the method `operations.add(2, 5)` we can assert one, and only one integer, to make this test pass.

````
Assert.AreEqual(addResult, 10, "2 + 5 doesn't equal 10."); // Will fail
Assert.AreEqual(addResult, 7, "If 2 + 5 doesn't equal 7, then my entire life is a lie."); // Will succeed
````

That is assertions in a nutshell. There are plenty of other assert methods other than Assert.AreEqual (You can check them all out [here](https://msdn.microsoft.com/en-us/library/microsoft.visualstudio.testtools.unittesting.assert.aspx)). As you can see, assertions are just checks to see if the result of the operation you performed in the Act stage meets a specific output that you define. Assertions seem simple on the surface, and syntactically they are. It is deciding what to assert, and whether you are writing good testable code that is a challenge.

### Putting It All Together

Now we can put all of those examples together in one testable case. Remember the generated file we looked at earlier? Let's modify that to take in our example.

````
namespace CodelabTests
{
    [TestClass]
    public class UnitTest1
    {
        private SimpleOperations operations;
    
        [TestInitialize]
        public void SetUp()
        {
            // Arrange
            operations = new SimpleOperations();
        }
    
        [TestMethod]
        public void TestAddition()
        {
            // Act
            var addResult = operations.add(2, 5); // User our add method for a result
            
            // Assert
            Assert.AreEqual(addResult, 10, "2 + 5 doesn't equal 10."); // Will fail
            Assert.AreEqual(addResult, 7, "If 2 + 5 doesn't equal 7, then my entire life is a lie."); // Will succeed
        }
        
        [TestCleanup]
        public void TearDown()
        {
            // Post-test cleanup
            operations = null;
        }
    }
}
````

Not so bad! We put `operations = new SimpleOperations();` In our `SetUp` function, as that will be called before any of our test methods are called (This is our **Arrange** portion). For example, our `TestAddition` method would have `SetUp` be called before any of it's statements are executed. Then our `TestAddition` statements execute the **Act** and **Assert** steps of our test.

### And Now, We Run It

// Insert example of running unit tests in Visual Studio

### Going From Here

Now that you have an idea of how both unit tests, and Microsoft Unit Testing Framework works, let's try creating unit test methods for the rest of our `SimpleOperations` class's methods. Then we can create an entirely new test case file for our `ComplexOperations`.
