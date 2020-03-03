
# ------------------------
# import necessary modules
# ------------------------

import vim
import string


# -------------------------------
# fetch tabs information from vim
# -------------------------------

nav_tabnr = int(vim.eval("a:tabnr"))
vim.command('redir @a')
vim.command('silent tabs')
vim.command('redir END')
tabs_output = vim.eval('@a')


# ---------------
# local variables
# ---------------

found = 0
check = 0

# set default values
nav_NERDTreeOn = 0
nav_TagbarOn = 0
nav_twomainwins = 0
nav_winright = 0
nav_locationlistleft = 0
nav_locationlistright = 0

# ----------------------
# interpret tabs command
# ----------------------

# get first character position
first_char = 2

# search current tab number section
while (found != 1):
    # scan string for a new line character
    last_char = tabs_output.index("\n",first_char)
    # look for "Tab page" string
    if tabs_output[first_char:first_char+9]=="Tab page ":
        # extract tab number
        tabnr_str = tabs_output[first_char+9:last_char]
        tabnr_int = int(tabnr_str)
        # compare with nav_tabnr variable
        if (tabnr_int==nav_tabnr):
            found = 1
        else:
            first_char = last_char + 1
    else:
        first_char = last_char + 1

# prepare information extraction
found = 0
first_char = last_char + 1

# extract information
while (found != 1):
    rest = tabs_output[first_char+4:len(tabs_output)]
    check = rest.count(" ")
    if(check == 0):
        found = 1
    # look for NERD_tree and Tagbar strings
    if (tabs_output[first_char+4:first_char+15]=="NERD_tree_1"):
        # print "I got NERD_tree_1 of tabnr: ",tabnr_int
        nav_NERDTreeOn = 1
    elif (tabs_output[first_char+4:first_char+19]=="[Location List]") & (nav_twomainwins==1):
        # print "I got NERD_tree_1 of tabnr: ",tabnr_int
        nav_locationlistleft = 1
    elif (tabs_output[first_char+4:first_char+19]=="[Location List]") & (nav_twomainwins==2):
        # print "I got NERD_tree_1 of tabnr: ",tabnr_int
        nav_locationlistright = 1
    elif (tabs_output[first_char+4:first_char+14]=="__Tagbar__"):
        # print "I got Tagbar of tabnr: ",tabnr_int
        nav_TagbarOn = 1
    else:
        nav_twomainwins = nav_twomainwins + 1
    if(found == 0):
        first_char = tabs_output.index("\n",first_char) + 1

# set remaining variables
nav_winright = nav_NERDTreeOn + nav_twomainwins + nav_locationlistleft + nav_locationlistright + nav_TagbarOn


# -----------------------------------
# set global vim navigation variables 
# -----------------------------------

vim.command("let g:NERDTreeOn = '%s'"% nav_NERDTreeOn)
vim.command("let g:TagbarOn = '%s'"% nav_TagbarOn)
vim.command("let g:winright = '%s'"% nav_winright)
vim.command("let g:twomainwins = '%s'"% nav_twomainwins)
vim.command("let g:locationlistleft = '%s'"% nav_locationlistleft)
vim.command("let g:locationlistright = '%s'"% nav_locationlistright)

