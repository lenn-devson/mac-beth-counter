# Code-Challenge: Count spoken lines in Mac Beth
As a Shakespeare buff, statistics junkie, and Unix lover, Ben finds himself wanting a command-line tool for analyzing Macbeth.
Write a command-line program that prints the number of lines spoken by each character in the play.

Conditions:
* You can find an XML-encoded version of Macbeth here: http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml.
* Your program should download and parse this file at runtime.
* Your solution should be tested, preferably via TDD. Running your tests should not download the play from the ibiblio.org server.
* Some lines are attributed to a speaker called "ALL". Your program should ignore these.

Also see [devlog](../devlog.txt) for implementation steps and thoughts

Setup:

- checkout/download project and place it somewhere
- make sure to have ruby installed on your machine ( developed on Ruby v. 2.5.3 )
- cd into project
- run bin/setup
- run ruby speaker_lines.rb
- enjoy the results
