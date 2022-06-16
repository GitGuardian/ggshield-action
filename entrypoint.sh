#! /usr/bin/env bash

args=("$@")
ggshield secret scan ${args[@]} ci
