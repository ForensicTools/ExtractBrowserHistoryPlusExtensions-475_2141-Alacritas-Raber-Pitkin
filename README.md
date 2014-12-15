##Readme/F.A.Q.

**Team Members:** Lucian Alacritas, Rashele Raber, Rafidah Pitkin

**Program Name:** GhostWindows Browser Extractor (GBE)

**Program Language:** Perl

**License:** MIT

###What is this?
GBE is a tool created in response to current tools that extract information from web browsers. We expect to make a tool that not only collects history and usage of the browser, but also lists what add-ons and extensions currently installed on it. We also want it to show the data in several ways, such as excel spreadsheets and graphs.

###Why is this useful?
It is useful to see what pages a user has visited frequently, and to see what kinds of extensions they like using. This information can be taken from multiple boxes and then compared to each other. This can give the analyst a good idea of what people are using. Or, if using it on a network, the analyst can see what people have in common with regards to web browsing.

###What did you use to make it?
The tool will be created in Perl.

###What’s its output?
The idea is to use different types of outputs, such as graphs and tables. They can be used to show the different types of information (i.e. history, extensions) in various ways.

###How does it work?
From the main menu, the user can extract the history from four different browsers: Chrome, Firefox, Safari, Opera. This cannot get history from private windows.

###Any limitations or issues?
**Limitations**: Currently only gets the history, not bookmarks or extensions. Does not go through Internet Explorer. <br/>
**Issues**: Firefox history file also stores bookmarks / keywords / etc., which we cannot currently separate.

###Updates:
**2014/10/17** - This document was created!

**2014/10/23** - Added gbe.java

**2014/11/16** - Edited readme to reflect language change

**2014/11/19** - GBE.pl version 1: get info from Chrome + output in command line and excel

**2014/12/14** - GBE version 1.5: from GBE_Menu.pl (main menu), run the programs for Chrome, Firefox, Safari, and / or Opera. Output in command line shows website list and count. Output in Excel shows website list and count, as well as four different graph types (line, pie, bar, column).
