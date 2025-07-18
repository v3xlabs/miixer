SCHEM=miixer.kicad_sch
BOARD=miixer.kicad_pcb
OUT=docs

build:
	kicad-cli sch export svg -o $(OUT)/schematics $(SCHEM)
	kicad-cli pcb render --perspective --quality high -w 900 -h 900 --zoom 0.8 --side top -o $(OUT)/pcb-front.png $(BOARD)
	kicad-cli pcb render --perspective --quality high -w 900 -h 900 --zoom 0.8 --side bottom -o $(OUT)/pcb-back.png $(BOARD)
	kicad-cli pcb render --perspective --quality high -w 900 -h 900 --zoom 0.8 --rotate "'10,20,0'" -o $(OUT)/pcb-angled.png $(BOARD)
