# Variables: prefixes, suffixes.

prefixes:=$(shell cat POs.txt)
quantity:=$(shell cat quantities.txt)
template:=$(shell cat templates.txt)
tree_name:=X_One_Tree_

# Declare phony targets: all clean
.PHONY : all clean

# Default target: all
all: all_new_branch_code.cpp all_push_code.cpp all_push_fail_code.cpp

# Generate "merged" codes [GNU Make code generated with Github Copilot]
all_new_branch_code.cpp, $(prefixes)
	cat $^ > $@

all_push_code.cpp: $(addsuffix -push_code.cpp, $(prefixes))
	cat $^ > $@

all_push_fail_code.cpp: $(addsuffix -push_fail_code.cpp, $(prefixes))
	cat $^ > $@
	

# branches for the physics objects ("POs")
%-branches.txt:

%-new_branch_code.cpp: %-branches.txt

%-push_code.cpp: %-branches.txt

%-push_fail_code.cpp: %-branches.txt



clean:
