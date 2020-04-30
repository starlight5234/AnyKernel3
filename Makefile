NAME ?= Unitrix-Kernel
DATE := $(shell date "+%d%m%Y-%I%M")
VERSION := 4.9-$(LINUX_VERSION)

SZIP := $(NAME)-$(VERSION)-BETA-$(DATE).zip


EXCLUDE := Makefile *.git* *.jar* Unitrix* *placeholder*

stable: $(SZIP)

$(SZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."
