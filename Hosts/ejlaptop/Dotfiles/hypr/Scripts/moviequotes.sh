#!/bin/sh

quotes=(
  "Everyone’s entitled to one good scare."
  "The night he came home."
  "You don’t know what death is."

  "Nobody trusts anybody now."
  "We’re not getting out of here alive."
  "It’s imitation."

  "One, two, Freddy’s coming for you..."
  "I’m your boyfriend now."
  "Welcome to prime time, bitch!"
  "This is God."

  "I want to play a game."
  "Game over."
  "Live or die. Make your choice."
  "Most people are so ungrateful to be alive."

  "We all go a little mad sometimes."
  "The power of Christ compels you!"
  "Your mother sucks cocks in hell."

  "In space, no one can hear you scream."
  "Who will survive, and what will be left of them?"

  "What’s your favorite scary movie?"
  "Do you like scary movies?"

  "They’re coming to get you, Barbara."
  "They’re here."
  "I see dead people."
)

# Pick a random quote
echo "${quotes[RANDOM % ${#quotes[@]}]}"
