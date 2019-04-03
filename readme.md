# Sushi.. Go! (Command line edition)

## Description


## Installation

1. Download/clone repo.
2. Run `bundle` from project directory.

# notes
- add .gemspec
- make this a ruby gem, can install and run by using command `sushi`
- starts app.rb; options are `host` or `join`
  - if `host`: starts websocket server on host machine. prompt for playername. generate 4-digit passcode. Show empty gameroom with 4 slots. wait for players to join. as they join, update the terminal to show their player names.
  - OR: start websocket server; then spin up websocket client, host as player 1. (that way hosting player gets treated same as all clients).
  - if `join`: prompt user to enter password. prompt to create player name. starts websocket client, connects to host machine ip/port on network. pings host to let them know join. print terminal with all player names.
- on 4th player join, game start. (or host can force start with a command. can we issue commands while updating terminal? maybe not..)
- start game logic; websocket server listens for card-select event. websocket client sends it upon Enter from client UI.
- at game end, terminate all clients + host websocket connections.