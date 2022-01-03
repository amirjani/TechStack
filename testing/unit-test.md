## Unit Test Dos And Dont's

## Do
1. Start writing tests early
   - TDD keeps your workspace clean
2. Test each and every function
3. Think more about the intended behavior of the case you’re testing
4. Mock every dependency but not too much 
5. Write Tests That Reveal a Bug, Then Fix It
6. Test must cover both side → Failure and Success
7. Maintain your tests like you maintain your production code
8. Test that every raised exception is tested
9. if setup is painful, refactor the code
10. Code coverage should be 100%, which means each and every line of the tested class was reached.
11. **Live deployment should not work with failing unit tests**
12. Write meaningful names which explain what the test is doing
     - for example: 
       - testUserRegistrationWasSuccessful
       - testUserRegistrationWasNotSuccessful
       - testUserRegistrationRepositoryThrowsException
13. Test specifications, not implementation
14. Isolate tests
15. Be very conservative in applying the typical Don’t Repeat Yourself (DRY) principles to unit tests.
16. Hide everything that is not important to see in that particular test.
17. Write your unit tests in a way that makes life easy for the person who will maintain them
18. Automate your testing
19. Test Across Boundaries
20. Write Simple “Fastball-Down-the-Middle” Tests First
21. Constantly Run Your Tests

## Don't
1. Tested class should never talk to database, file, network resources etc.
2. Dependencies in tested class should not create real class objects.