#'working out what counts as a billable article is a challenge for many developers'

Putting your github cart under version control

download build.sh and run the script at you command prompt
you@prompt build.sh

For namespace select the name of the company and the module you are putting under version control. (say '2tall' and 'tallbasket'). For package choose your current Magento theme package and subtheme ('magezurb' and 'default'). 

This will build out your modules file tree and create the minimal set of files a magento extension needs to run. 

You will also be asked to choose a permission level for your folders. For local development i choose 755 and can see no reason why this shouldn't work for production also. This will generate a file of permissions_2tall_tallbasket.sh [see https://github.com/BinaryGeometry/tallbasket/commit/2089de2fd194eec455e5a7bd4e51b740c211cd21] which you can run 
you@prompt permissions_2tall_tallbasket.sh
at a later time to reset permissions across your module once you have created some additional files.

It will also generate a .gitignore file for your newly created plugin files and a humans.txt message for you to keep notes on, should you have anything to say to archeologists of the future. 

Now you have your files it's a good idea to put them under version control before you make any modifications. It's possible there is already a git instance in the root of your Magento install. If this is the case type

you@prompt mv .git .old.git && mv .gitignore .old.gitignore 

and follow along with everyone else by typing

you@prompt git init 
you@prompt git add . 
you@prompt git status #to confirm only the correct files have been checked in
you@prompt git commit -m "inital commit"

 
