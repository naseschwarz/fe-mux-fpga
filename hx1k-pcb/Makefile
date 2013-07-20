.PHONY: all

PNAME=osf-hx1k

all:
	@echo "Please use specific targets."

include common.mk

gerbers-seeed:
	mkdir gerbers-seeed

copy-gerbers-seeed: gerbers-seeed
	cp $(PNAME).top.gbr gerbers-seeed/$(PNAME).GTL
	cp $(PNAME).bottom.gbr gerbers-seeed/$(PNAME).GBL
	cp $(PNAME).bottommask.gbr gerbers-seeed/$(PNAME).GBS
	cp $(PNAME).topmask.gbr gerbers-seeed/$(PNAME).GTS
	cp $(PNAME).topsilk.gbr gerbers-seeed/$(PNAME).GTO
	cp $(PNAME).bottomsilk.gbr gerbers-seeed/$(PNAME).GBO
	cp $(PNAME).plated-drill.cnc gerbers-seeed/pcbname.txt

package-gerbers-seeed: copy-gerbers-seeed
	zip -r gerbers-seeed.zip . -i gerbers-seeed/*
