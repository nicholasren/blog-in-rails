Feature: As a blogger, I want to manage my posts

  Scenario: create post
    Given the blogger is on creating post page 
    When the blogger create blog with the following detail:
      | title   | my first blog                     |
      | content | I will tell you a long long story |
    Then the created blog should be shown on blog list page

  Scenario: delete post
    Given the blogger has a post with the following details:
      | title   | how to be a vimer                     |
      | content | vim is the greated editor I ever used |
    Then the created blog should be shown on blog list page
    When the blogger delete the blog with title "how to be a vimer"
    Then there will not be a post with title "how to be a vimer" on blog list page
