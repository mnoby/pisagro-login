@B2Btrace-PISAGRO
Feature: Log In

@Login
Scenario: Sumbit login
Given open the website
Then user wait element and input username pass
Then user check login success or not
Then user closing the browser