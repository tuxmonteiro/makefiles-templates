BUILD_DIR ?= .build
PROJECT_NAME ?= $(shell basename $(dir $(abspath $(firstword $(MAKEFILE_LIST)))))

include docker.mk
include go.mk
include go.mod.mk
include help.mk

.DEFAULT_GOAL := help

GO_MAIN_DIR := ./

## build: Build all artifacts (binary and docker image)
.PHONY: build
build: | go-build docker-build

## clean: Remove all artifacts (binary and docker image)
.PHONY: clean
clean: | go-clean docker-clean

## install: Install all artifacts
.PHONY: install
install: | go-install
