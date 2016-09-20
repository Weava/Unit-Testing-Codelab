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
