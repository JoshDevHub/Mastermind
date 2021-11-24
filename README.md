# Mastermind

A command-line game of [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) built using Ruby.

## Live Preview

Try out the game on [replit](https://replit.com/@jmsmith1018/Mastermind#README.md)

## How to Play

Clone this repo and run `$ruby main.rb` or, more conveniently, visit the replit I've setup.

My version is slightly altered from the traditional board game version of Mastermind, so here's a quick rundown of the rules:

- One player creates a "code" made up of 4 digits, each digit between 1 and 6 (inclusive).
- The other player attempts to guess the code. They get feedback on how good accurate their code is:
    - A perfect match indicates a digit that is the correct value and in the correct place in the code.
    - An imperfect match indicates a digit whose value is present in the master code, but the guess didn't have it in the correct place.
    - None indicates digits that aren't present in the code at all.
- For each round of guessing, the Code Master gains 1 point. When the Code Breaker gets the code correct OR the game has reached 12 rounds in length, the game will end and the players will switch roles and play a new game.
- After the second game, the player with the most points wins!

In this game, the two players are always the user and a "computer" player that I've built. See if you can beat it :stuck_out_tongue:

## Special Thanks

This was done as part of [The Odin Project](https://theodinproject.com), an open source curriculum for learning web development.