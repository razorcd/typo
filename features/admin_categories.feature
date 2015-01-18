Feature: Administer Categories
  As a blog administrator
  In order to group my articles in categories
  I want to be able to add and edit categories
  
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: See a list of categories
    Given I am on the admin content page
    When I follow "Categories" within css class "sidebar"
    Then I should be on the admin categories new page
@tag    
  Scenario: Create a new category
    Given I am on the admin categories page
    When I fill in "Name" with "New Category"
    And I fill in "Keywords" with "new keywords"
    And I fill in "Description" with "Description of the New Category"
    And I press "Save"
    Then I should see "New Category" within css id "category_container"
    
    # Given I am on the new article page
    # When I fill in "article_title" with "Foobar"
    # And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    # And I press "Publish"
    # Then I should be on the admin content page
    # When I go to the home page
    # Then I should see "Foobar"
    # When I follow "Foobar"
    # Then I should see "Lorem Ipsum"