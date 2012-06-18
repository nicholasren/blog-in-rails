Feature: As a blogger, I want to manage my posts

  Scenario: create post
    Given the blogger is on creating post page 
    When the blogger create blog with the following detail:
      | title   | my first blog                     |
      | content | I will tell you a long long story |
    Then the created blog should be shown on blog list page
