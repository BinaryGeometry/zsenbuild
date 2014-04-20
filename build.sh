#!/bin/bash
#### 
# Builds a skeliton magento module 
#######

#- takes user variables -#

# echo -e "enter namespace"
# read NAMESPACE
# echo -e "enter modulename"
# read MODULENAME
# echo -e "enter codepool"
# read CODEPOOL
# echo -e "enter package"
# read PACKAGE
# echo -e "enter themename"
# read THEMENAME
# echo "YOU ARE CREATING"
# echo "$NAMESPACE $MODULENAME"
# echo "IN"
# echo "$PACKAGE / $THEMENAME"

NAMESPACE=zsen
MODULENAME=tallbasket
CODEPOOL=local
PACKAGE=magezurb
THEMENAME=default


## --
#---- Begin Module Creation

## Create code direcotory
mkdir -p app/code/community/$NAMESPACE/$MODULENAME/Block/
mkdir -p app/code/community/$NAMESPACE/$MODULENAME/controllers/
mkdir -p app/code/community/$NAMESPACE/$MODULENAME/etc/
mkdir -p app/code/community/$NAMESPACE/$MODULENAME/Helper/
echo 'CREATING app/code/community/$NAMESPACE/$MODULENAME/{Block, controllers, etc, Helpers}'
#
## Create Block
touch app/code/community/$NAMESPACE/$MODULENAME/Block/auxiloryBlock.php
echo "CREATING app/code/community/$NAMESPACE/$MODULENAME/Block/auxiloryBlock.php"
touch app/code/community/$NAMESPACE/$MODULENAME/Block/auxiloryBlock.php
echo "CREATING app/code/community/$NAMESPACE/$MODULENAME/Block/auxiloryBlock.php"
## Create controller
touch app/code/community/$NAMESPACE/$MODULENAME/controllers/indexController.php
echo "CREATING app/code/community/$NAMESPACE/$MODULENAME/controllers/indexController.php"
touch app/code/community/$NAMESPACE/$MODULENAME/controllers/auxiloryController.php
echo "CREATING app/code/community/$NAMESPACE/$MODULENAME/controllers/auxiloryController.php"
## Create xml
touch app/code/community/$NAMESPACE/$MODULENAME/etc/config.xml
echo "CREATING app/code/community/$NAMESPACE/$MODULENAME/etc/config.xml"
## Create Helpers
touch app/code/community/$NAMESPACE/$MODULENAME/Helper/Data.php
echo "CREATING app/code/community/$NAMESPACE/$MODULENAME/Helper/Data.php"


## Create etc/modules
mkdir -p app/etc/modules/
#
## Create namespace_module.xml
touch app/etc/modules/${NAMESPACE}_${MODULENAME}.xml
echo "app/CREATING etc/modules/${NAMESPACE}_${MODULENAME}"


## Create template directory
mkdir -p app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME/
echo "CREATING app/design/frontend/$PACKAGE/$THEMENAMEe/default/$NAMESPACE/$MODULENAME/"
# 
## Create template files
touch "app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME/index-block.phtml"
echo "CREATING app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME/index-block.phtml"
touch "app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME/"
echo "CREATING app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME/auxilory-block-block.phtml"

## Create layout directory
mkdir -p app/design/frontend/$PACKAGE/$THEMENAME/layout/$NAMESPACE
echo "CREATING app/design/frontend/$PACKAGE/$THEMENAMEdefault/$NAMESPACE"
# 
## Create layout file
touch "app/design/frontend/$PACKAGE/$THEMENAME/layout/$NAMESPACE/${NAMESPACE}_${MODULENAME}.xml"
echo "CREATING app/design/frontend/$PACKAGE/$THEMENAME/layout/$NAMESPACE/${NAMESPACE}_${MODULENAME}.xml"


# ## Create JS directory
# mkdir -p js/$NAMESPACE/$MODULENAME/libary
# echo "CREATING js/$NAMESPACE/$MODULENAME";
# #
# ## Create namespace_modulebame.js
# touch js/$NAMESPACE/$MODULENAME/${NAMESPACE}_${MODULENAME}.js
# echo "CREATING js/$NAMESPACE/$MODULENAME/${NAMESPACE}_${MODULENAME}.js"


## Create Skin directory
mkdir -p skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/sass
mkdir -p skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/stylesheet
mkdir -p skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/js
# mkdir -p skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/{sass/stylesheet/js}
echo "CREATING skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/{sass,styesheet.js}"
#
## Create SASS file
touch skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/sass/${NAMESPACE}-${MODULENAME}.sass
echo "CREATING skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/sass/${NAMESPACE}-${MODULENAME}.sass"
## Create CSS file
touch skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/stylesheet/${NAMESPACE}-${MODULENAME}.css
echo "CREATING skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/stylesheet/${NAMESPACE}-${MODULENAME}.css"
## Create CSS file
touch skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/js/${NAMESPACE}-${MODULENAME}.js
echo "CREATING skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/js/${NAMESPACE}-${MODULENAME}.js"

## --
#---- Adjust Permissions File

## Prompt user for permission value
echo -e "enter permission value"
read PERMISSION
#
cat > permissions-${NAMESPACE}_${MODULENAME}.sh << EOF
    \### permissions-$NAMESPACE_$MODULENAME.sh
	chmod -Rv $PERMISSION app/code/community/$NAMESPACE/$MODULENAME
	chmod -v $PERMISSION app/etc/modules/$NAMESPACE_$MODULENAME.xml
	chmod -v $PERMISSION app/design/frontend/$PACKAGE/$THEMENAME/layout/$MODULENAME.xml
	chmod -Rv $PERMISSION app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME
	chmod -Rv $PERMISSION skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME

	chmod -Rv $PERMISSION app/code/community/$NAMESPACE/$MODULENAME
	chmod -v $PERMISSION app/etc/modules/$NAMESPACE_$MODULENAME.xml
	chmod -v $PERMISSION app/design/frontend/$PACKAGE/$THEMENAME/layout/$MODULENAME.xml
	chmod -Rv $PERMISSION app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME
	chmod -Rv $PERMISSION skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME
EOF

## Run permissions file
permissions-${NAMESPACE}_${MODULENAME}.sh
echo "PERMISSIONS SET TO $PERMISSION"
echo "TO RESET PERMISSIONS:"
echo "you@commandprompt permissions-${NAMESPACE}_${MODULENAME}.sh" 


# ## --
# #---- Create .gitignore
cat > .gitignore << EOF
/*
!app/
/app/*
!app/code/
/app/code/*
!app/code/community/
/app/code/community/*
!app/code/community/$NAMESPACE/
/app/code/community/$NAMESPACE/*
!app/code/community/$NAMESPACE/$MODULENAME

!app/design/
/app/design/*
!app/design/frontend/
/app/design/frontend/*
!app/design/frontend/$PACKAGE/
/app/design/frontend/$PACKAGE/*
!app/design/frontend/$PACKAGE/$THEMENAME/
/app/design/frontend/$PACKAGE/$THEMENAME/*

!app/design/frontend/$PACKAGE/$THEMENAME/template/
/app/design/frontend/$PACKAGE/$THEMENAME/template/*
!app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/
/app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/*
!app/design/frontend/$PACKAGE/$THEMENAME/template/$NAMESPACE/$MODULENAME/

!app/design/frontend/$PACKAGE/$THEMENAME/layout/
/app/design/frontend/$PACKAGE/$THEMENAME/layout/*
!app/design/frontend/$PACKAGE/$THEMENAME/layout/$NAMESPACE_$MODULENAME.xml

!app/etc/
/app/etc/modules/*
!app/etc/modules/$NAMESPACE_$MODULENAME.xml

!js/
/js/*
!js/$NAMESPACE/
/js/$NAMESPACE/*
!js/$NAMESPACE/$MODULENAME

!skin/
/skin/*
!skin/frontend/
/skin/frontend/*
!skin/frontend/$NAMESPACE/
/skin/frontend/$NAMESPACE/*
!skin/frontend/$PACKAGE/$THEMENAME/
/skin/frontend/$PACKAGE/$THEMENAME/*
!skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/
/skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/*
!skin/frontend/$PACKAGE/$THEMENAME/$NAMESPACE/$MODULENAME/

!permissions_${NAMESPACE}_{$MODULENAME}.sh
!humans.txt
!.gitignore
!billablearticle.md

#!zsenbuild_build.sh
!zsenbuild_manifest.sh
!build.sh
EOF

echo "CREATING .gitignore"

## --
#---- Create humans.txt
## Prompt user for permission value
echo -e "are you human"
read HUMAN
touch humans.txt 
if [ $HUMAN = "NO" ] || [ "$HUMAN" = "No" ] || [ "$HUMAN" = "no" ] 
 then 
	echo "this module was made by a machine" > humans.txt
	echo "WRITING $HUMAN > humans.txt"
else
	echo "$HUMAN">humans.txt
	echo "WRITING $HUMAN > humans.txt"
fi

echo "WOOT, YOU NOW HAVE A MODULE"
