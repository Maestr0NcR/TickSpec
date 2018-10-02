#!/bin/bash
if test "$OS" = "Windows_NT"
then
  # use .Net
  .paket/paket.exe restore
  exit_code=$?
  if [ $exit_code -ne 0 ]; then
  	exit $exit_code
  fi

  dotnet restore build.proj
  dotnet fake build %*
else
  # use mono
  mono .paket/paket.exe restore
  exit_code=$?
  if [ $exit_code -ne 0 ]; then
  	exit $exit_code
  fi

  dotnet restore build.proj
  dotnet fake build %*
fi