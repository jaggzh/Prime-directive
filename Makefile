VIARGS=Makefile log/log.txt prime-directive.py world.py ansi.py {RO}../nn-punk/nn-punk.py util.py ansi_str_colorize_demo.py
VIARGS=Makefile log/log.txt prime-directive.py world.py ansi.py ../nn-punk/nn-punk.py util.py ansi_str_colorize_demo.py
VISTART=prime-directive.py
SHELL=/bin/bash
PROG=./prime-directive.py
LOG=log/log.txt
TEEPROG=tee $(LOG)
#STRIPJIB=grep -v 'replica:0'

all: run

run:
	#stdbuf -i0 -o0 $(PROG) 2> $(LOG)
	$(PROG) 2> $(LOG)
	stty sane

vi:
	@#s=`for f in $(VIARGS); do if [[ "$$f" =~ ^\{RO\} ]]; then printf "%s " "-c 'arge +set\ ro $${f#\{RO\}}'"; else printf "%s " "-c 'arge $$f'"; fi; done; printf "%s" "-c 'arge $(VISTART)'"`; printf "%s " $$s; eval "vim $$s"
	#a=(); for f in $(VIARGS); do if [[ "$$f" =~ ^\{RO\} ]]; then a+=('-c' "arge +set\ ro $${f#\{RO\}}"); else a+=('-c' "arge $$f"); fi; done; a+=('-c' 'arge $(VISTART)'); printf "%s\n" "$${a[@]}"; vim "$${a[@]}"
	vim $(VIARGS)

clean:
	rm data/weights*
	#rm weights-*

ctags:
	ctags $(PROG)
