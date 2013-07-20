.PHONY: gsch2pcb g2p clean g2p-cmd ge gsymcheck pe mrproper config-files pecmd

SCH=$(PNAME).sch
PRJ=$(PNAME).prj
PCB=$(PNAME).pcb
NEWPCB=$(PNAME).new.pcb
NET=$(PNAME).net
CMD=$(PNAME).cmd

g2p:
	$(MAKE) gsch2pcb

gsch2pcb: $(PNAME).prj
	$(MAKE) $(PRJ)
	gsch2pcb -f $(PRJ)

$(PCB): gsch2pcb

$(NET): gsch2pcb

$(PRJ):
	sh -c 'echo > $(PRJ); \
	echo "elements-dir footprints" >> $(PRJ); \
	echo "elements-dir symbols" >> $(PRJ); \
	echo "schematics $(SCH)" >> $(PRJ); \
	echo "empty-footprint nofootprint" >> $(PRJ); \
	echo "output-name $(PNAME)" >> $(PRJ)'

attribs:
	sh -c 'echo -n > attribs; \
		echo value >> attribs; \
		echo footprint >> attribs;'

bom.txt: attribs
	sh -c 'cat attribs; gnetlist -g bom -o bom.txt $(SCH); rm attribs'

gafrc:
	sh -c 'echo "(component-library \"./symbols\")" > gafrc'

config-files: gafrc attribs $(PRJ)

clean:
	-rm -f -- $(PRJ) 
	-rm -f -- $(NET) 
	-rm -f -- $(CMD) 
	-rm -f -- $(NEWPCB) 
	-rm gafrc
	-rm attribs
	-rm bom.txt
	-rm "$(PCB).bak"*
	-rm PCB.*.save
	-rm PCB.*.backup
	-rm "$(PCB)-"
	-rm "$(SCH)~"


mrproper: clean
	-rm -f PCB.*.backup
	-rm -f PCB.*.save
	-rm -f -- $(PCB).bak*  
	-rm -f -- $(SCH)~ 
	-rm -f symbols/*~

ge: gafrc $(PRJ)
	gschem "$(SCH)"

pe:
	pcb "$(PCB)"

pecmd:
	pcb --action-script barometer-pcb.cmd "$(PCB)"

gsymcheck:
	gsymcheck -vv symbols/*.sym

.gitignore:
	sh -c ' \
	echo '*~' >> .gitignore; \
	echo $(NEWPCB) >> .gitignore; \
	echo $(NET) >> .gitignore; \
	echo $(PRJ) >> .gitignore; \
	echo $(CMD) >> .gitignore; \
	echo 'bom.txt' >> .gitignore; \
	echo 'symbols/*~' >> .gitignore; \
	echo 'gafrc' >> .gitignore; \
	echo 'PCB.*.save' >> .gitignore; \
	echo $(PCB)'.bak' >> .gitignore; \
	'
