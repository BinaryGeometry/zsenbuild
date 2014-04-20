#!/bin/bash
#### 
# Sets up manifest 
#######

NAMESPACE=zsen
MODULENAME=tallbasket

## First word
source zsenbuild/firstword.sh firstword
talk

## Build Basket
source zsenbuild/basket.sh $NAMESPACE $MODULENAME
compile



