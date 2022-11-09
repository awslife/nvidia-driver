include $(CURDIR)/version.mk

CRI ?= docker
CRI_ARGS ?= --no-cache --force-rm --progress=plain

DOCKERFILE ?= $(CURDIR)/rocky/Dockerfile

BUNDLE_IMAGE ?= nvcr.io/nvidia/cuda
OUT_IMAGE_NAME := docker.io/awslife/nvidia/driver
OUT_IMAGE_TAG := $(DRIVER_VERSION)-$(OS_NAME)$(OS_VERSION)

.DEFAULT_GOAL := default

default: .build_rocky .tag .push

.PHONY: build
build: .build_rocky

.PHONY: tag
tag: .tag

.PHONY: push
push: .push

.PHONY: clean
clean: .clean

.build_rocky:
	DOCKER_BUILDKIT=1
	$(CRI) build $(CRI_ARGS) \
		--tag $(OUT_IMAGE_NAME):$(OUT_IMAGE_TAG) \
		--build-arg BUNDLE_IMAGE=$(BUNDLE_IMAGE) \
		--build-arg CUDA_VERSION=$(CUDA_VERSION) \
		--build-arg DRIVER_VERSION=$(DRIVER_VERSION) \
		--build-arg DONKEY_VERSION=$(DONKEY_VERSION) \
		--file $(DOCKERFILE) $(CURDIR)/rocky

.tag:
	@echo "tag"

.push:
	@echo "push"

.clean:
	$(CRI) rmi -f $(BUNDLE_IMAGE):$(CUDA_VERSION)-base-ubi8
	$(CRI) rmi -f $(OUT_IMAGE_NAME):$(OUT_IMAGE_TAG)
