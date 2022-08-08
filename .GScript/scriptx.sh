#!/bin/bash


CHECK_PIPENV=$(pip freeze | grep pipenv)
CHECK_PIPENV=$(echo $CHECK_PIPENV | awk '{print $1}' | awk -F '==' '{print $1}')

if [[ $CHECK_PIPENV = pipenv ]]; then
  echo "Yes, $CHECK_PIPENV is installed "
else
  echo "No, pipenv is not installed ..."
  echo $CHECK_PIPENV
fi
