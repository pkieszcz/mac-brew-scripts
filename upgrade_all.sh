#!/bin/bash

brew update
brew upgrade --all

brew cask update

brew cleanup
brew cask cleanup
