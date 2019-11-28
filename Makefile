all: huv.gen.hfst huv.mor.hfstol

huv.lexc.hfst: huv.lexc
	hfst-lexc $< -o $@

huv.twol.hfst: huv.twol
	hfst-twolc $< -o $@

huv.gen.hfst: huv.twol.hfst huv.lexc.hfst
	hfst-compose-intersect -1 huv.lexc.hfst -2 huv.twol.hfst -o $@

huv.mor.hfstol: huv.mor.hfst
	hfst-fst2fst -w $< -o $@

huv.mor.hfst: huv.gen.hfst
	hfst-invert $< -o $@
