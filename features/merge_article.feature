Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist
    | id  | title          | body               | author |
    | 5   | First article  | Lorem ipsum        | user1  |
    | 6   | Second article | Second lorem ipsum | user2  |
@tag1
  Scenario: Successfully merge articles
    Given I am on the admin content page for "First article"
    And I fill in "merge_with" with "6"
    And I press "Merge"
    Then the article "First article" should have body "Lorem ipsum Second lorem ipsum"
    And the article "First article" should have author "user1"

