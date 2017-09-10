default: test

SHELL = bash
dirs = {bin,libexec}
prefix ?= /usr/local
bot = setzer-bot

dirs:; mkdir -p $(prefix)/$(dirs)
files = $(shell ls -d $(dirs)/*)
install:; cp -r -n $(dirs) $(prefix)
link: dirs; for x in $(files); do ln -s `pwd`/$$x $(prefix)/$$x; done
uninstall:; rm -r $(addprefix $(prefix)/,$(files))
service:; cp $(bot).service /etc/systemd/system/ && systemctl daemon-reload
start: service; systemctl start $(bot)
stop:; systemctl stop $(bot)
status:; systemctl status $(bot)
log:; journalctl -f -n 50 -u $(bot)

test:; ! grep '^#!/bin/sh' libexec/*/* && \
grep '^#!/usr/bin/env bash' libexec/*/* | \
cut -d: -f1 | xargs shellcheck -e SC1090 -e SC2018 -e SC2019
