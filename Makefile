
all: nglib examples

nglib:
	$(MAKE) -C nglib

examples:
	$(MAKE) -C examples 

clean:
	$(MAKE) -C nglib clean
	$(MAKE) -C examples clean

.PHONY: clean nglib examples
