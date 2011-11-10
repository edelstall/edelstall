# Setup

- *Instructions are for a Mac*
- *In the future, the instructions will be abstracted to `church deploy`, instead of the `atheycreek` use-case* 

## Local environment

- Open *Terminal* from the *Applications > Utilities* folder ( or just use Spotlight to find it )
- Create a folder to hold the project in *Finder*
- In *Terminal* type `cd ` and then drag and drop the folder you just created into the *Terminal* window, hit return.
- Run the following commands

	   	git clone git@github.com:atheycreek/churchdeploy.git
		cd churchdeploy
		git submodule update --init
		cd www/httpdocs/extensions/datetime
		git submodule update --init

- Use `http://churchdeploy/` as your local hosting environment 
	- Have the root pointing to *httpdocs*
    - We recommend [MAMP PRO](http://www.shareit.com/programs.html?productid=300169372)
- Setup a database named `churchdeploy` with the both the username and password set to `root`
    - database encoding should be `UTF-8`
- The default admin account credentials for `http://churchdeploy/symphony/`
    - **User:** admin  
    - **Password:** k42j3b42kjb
- Be sure to set all files to read/write, we recommend using [BatChMod](http://www.lagentesoft.com/batchmod/index.html) (Check all checkboxes once you have the selected directory, see [example](http://see.weareinto.com/9Q73))
- We recommend using [Espresso](http://macrabbit.com/espresso/) for code editing. `.esproj` files may be in some areas of the project, and this will help to have settings already in place.

## Prerequisites

### Required

#### Server requirements

- PHP 5.3.2 or later
- PHP's LibXML module, with the XSLT extension enabled (--with-xsl)
- MySQL 5.0 or later
- Apache webserver with mod_rewrite

### Optional

- Typekit account
- UStream premium account

## Membership

There is a default user that is installed as a member, here are his credentials..

- Name: John Doe
- Email: john_doe@churchdeploy.com
- Password: k12j$B11k

## Keeping up to date

At any time you can run these commands to keep up to date

	git pull
	git submodule foreach git pull origin master