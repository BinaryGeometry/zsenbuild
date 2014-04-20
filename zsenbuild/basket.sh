#!/bin/bash
#### 
# Builds a basket 1@
#######

NAMESPACE=$1
MODULENAME=$2

# pass necessary outside variables 
## and dont burn the soup
### see, it is magic really
function compile()
{
	echo "$NAMESPACE $MODULENAME"
}  
