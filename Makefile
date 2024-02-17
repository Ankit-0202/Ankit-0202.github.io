####################################################
##################### MAKEFILE #####################
####################################################

.PHONY: commit push full clean

#########################
########## GIT ##########
#########################

commit:
ifeq ($(strip $(cm)),)
	@echo "Error: cm is required. Please provide a commit message."
else
	git add -A
	git commit -m "$(cm)"
endif

# Push the changes to the remote repository
push:
	make commit
	git push

full:
	make clean push cm="Full update"


#########################
###### MAINTENANCE ######
#########################

# Clean temporary and unneeded files/directories
clean:
	find . -type f -name .DS_Store -delete &
	find . -type f -name .dccache -delete &
	find . -type d -name __pycache__ -exec rm -r {} + &