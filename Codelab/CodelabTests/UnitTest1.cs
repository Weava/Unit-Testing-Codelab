using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Codelab;

namespace CodelabTests
{
    [TestClass]
    public class UnitTest1
    {
        private SimpleOperations operations;

        [TestInitialize]
        public void SetUp()
        {
            operations = new SimpleOperations();
        }

        [TestMethod]
        public void TestAddition()
        {
            int addResult = operations.add(2, 5);

            Assert.AreEqual(addResult, 10, "2 + 5 != 10");
            Assert.AreEqual(addResult, 7, "2 + 5 = 7");
        }

        [TestCleanup]
        public void TearDown()
        {
            operations = null;
        }
    }
}
