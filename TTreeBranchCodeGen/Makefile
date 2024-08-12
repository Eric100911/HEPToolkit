# Variables: physics objects as prefixes, quantities to be added as branches.
objects:=$(shell cat POs.txt)
# Variables: cpp code templates, including their names.
template_name:=$(shell cat template_list.txt)
template_file:=$(addprefix templates/,$(addsuffix .cpp,$(template_name)))
branched_temp:=$(addprefix branched_templates/,$(addsuffix .cpp,$(template_name)))

# Declare phony targets: all clean
.PHONY : all clean

# Default target: all
all: $(addprefix gen_code/, $(addsuffix .cpp,$(objects)))

# Task 1: Generate code for branches of some object __PO
branched_templates/%.cpp: templates/%.cpp quantities.txt tree_name.txt
	mkdir -p branched_templates
	scripts/subst_expand.sh -i $< -w __BRANCH_NAME -p __PO_NAME_ < quantities.txt > .tmp.cpp
	scripts/subst_expand.sh -i .tmp.cpp -w __TTREE_NAME < tree_name.txt > $@
	rm .tmp.cpp

# Task 1.5: Generate code for branches of all objects
gen_code/%.cpp: $(branched_temp)
	mkdir -p gen_code
	cat $(branched_temp) > .tmp.cpp
	echo $* | scripts/subst_expand.sh -i .tmp.cpp -w __PO_NAME  > $@

# [TODO] Task 2: Generate code for branches of all objects by templates.


# Cleaning up
clean:
	rm -rf branched_templates
	rm -rf gen_code
	rm -f .tmp.cpp 
