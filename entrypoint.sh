#!/bin/sh -l

args=($@)
ggshield scan ${args[@]} ci
