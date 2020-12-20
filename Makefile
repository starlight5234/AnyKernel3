NAME ?= Starlight-Kernel
DATE := $(shell date "+%d%m%Y-%I%M")
VERSION := $(KERN_VER)

ZIP := $(NAME)-$(VERSION)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Star* *placeholder*

zip: $(ZIP)

$(ZIP):
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
