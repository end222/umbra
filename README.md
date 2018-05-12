# Umbra
## What is Umbra?
Umbra is an AUR helper for Arch Linux which is written in Ruby

## Why another AUR helper?
Umbra exists mainly because I wanted to make a more serious programming project mainly to practice and improve. I do not have any particular reason why it is better than other AUR helpers.

The main difference is that Umbra is written in Ruby, a language that I really like and, as far as I know, hasn't been used in other helpers so I wanted to see how it resulted.

## Features
* Written in Ruby
* Uses git to fetch from the AUR

## Dependencies
* Ruby
* Git
* Curl
* Makepkg
* Colorize gem (gem install colorize)

## As it is a WIP, what features are working?
So far umbra can only:
* Install packages from the AUR and official repos
* Update the system (Only official repos)
* Remove a package and its dependencies

## Configuration Files
Umbra is configured using:
/etc/umbra/config (Global configuration file)
~/.umbra/config (User configuration file)

User configuration file has preference over global one if it exists
