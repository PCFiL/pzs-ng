#############################################################
# Project Zipscript Next Generation - Sitebot Configuration #
#                (originally by Dark0n3)                    #
# This is configuration for dZSbot.tcl                      #
#############################################################
# BASIC CONFIG                                              #
#############################################################
# Locations of all the usual files, change is usually only required
# if you have another glroot than /glftpd/ =)
set location(PASSWD)		"/glftpd/etc/passwd"
set location(USERS)		"/glftpd/ftp-data/users/"
set location(GLCONF)		"/etc/glftpd.conf"

# Multiple Log Files
# If you wish to read several logfiles, uncomment/add and change path/name(s).
set glftpdlog(GLLOG01)		"/glftpd/ftp-data/logs/glftpd.log"
#set glftpdlog(GLLOG02)		"/glftpd/ftp-data/logs.ext/glftpd.log"
set loginlog(LOGINLOG01)	"/glftpd/ftp-data/logs/login.log"
#set loginlog(LOGINLOG02)	"/glftpd/ftp-data/logs.ext/login.log"

# Should the bot die if a binary is missing - or just output that something is wrong?
set die_on_error		"NO"

# Allow people to invite themselves to the channel through IRC. WARNING! This is
# considered a security threat because if someone steals the nickname of the bot
# they will be able to easily harvest usernames/passwords. CONSIDER WITH CAUTION!
# You can set it to "YES" or "NO".
set enable_irc_invite	"NO"

# Are you using glftpd2? Default setting ("AUTO") should be safe,
# enables autodetection (if binary(GLFTPD) is set correctly)
# To override autodetection (or if it just doesn't work), you can set
# it to "YES" or "NO".
set use_glftpd2 		"AUTO"

# What types of messages are counted as the different types of output
# (for disabling etc)
set msgtypes(RACE) 		"NEWDIR DELDIR INCOMPLETE NUKE UNNUKE PRE RACE_RAR RACE_ZIP RACE_OTHER RACE_VIDEO RACE_AUDIO SFV_RAR SFV_OTHER SFV_VIDEO SFV_AUDIO DOUBLESFV UPDATE_RAR UPDATE_OTHER UPDATE_VBR UPDATE_CBR UPDATE_VIDEO UPDATE_ZIP HALFWAY_RACE_RAR HALFWAY_RACE_ZIP HALFWAY_RACE_OTHER HALFWAY_RACE_VIDEO HALFWAY_RACE_AUDIO HALFWAY_NORACE_RAR HALFWAY_NORACE_ZIP HALFWAY_NORACE_OTHER HALFWAY_NORACE_VIDEO HALFWAY_NORACE_AUDIO NEWLEADER_RAR NEWLEADER_ZIP NEWLEADER_OTHER NEWLEADER_VIDEO NEWLEADER_AUDIO COMPLETE_RAR COMPLETE_ZIP COMPLETE_AUDIO_CBR COMPLETE_AUDIO_VBR COMPLETE_OTHER COMPLETE_VIDEO COMPLETE_STAT_RACE_RAR COMPLETE_STAT_RACE_ZIP COMPLETE_STAT_RACE_AUDIO_CBR COMPLETE_STAT_RACE_AUDIO_VBR COMPLETE_STAT_RACE_OTHER COMPLETE_STAT_RACE_VIDEO BADGENRE BADYEAR BADBITRATE BAD WIPE WIPE-r IMDB IMDBVAR"
set msgtypes(DEFAULT) 		"MSGINVITE BADMSGINVITE INVITE LOGIN LOGOUT REQUEST REQFILLED IMDBFIND DEBUG TIMEOUT TAGLINE"

# This allows you to customize your annoncements depending on the path where
# the action is taking place. The string matching is done using the TCL
# construct "string match -nocase", so it is case insensitive by default.
# PS! This is NOT intended as a way to cutomize each section of a site. It
# should work, but would require a LARGE amount of msgreplace() statements.
# Remember to create an announce for your custom message in the theme file!
# Format: "original message type:string to look for in path:new message type"
#set msgreplace(0)		"NEWDIR:*/sample:SAMPLE"
#set msgreplace(1)		"NEWDIR:*/cd?:NEWCD"
#set msgreplace(2)		"NEWDIR:*/disc?:NEWDISC"
#set msgreplace(3)		"NEWDIR:*/disk?:NEWDISC"
#set msgreplace(4)		"NEWDIR:*/subs:SUBTITLES"
#set msgreplace(5)		"NEWDIR:*/vobsub:SUBTITLES"
#set msgreplace(6)		"NEWDIR:*/cover:COVERS"
#set msgreplace(7)		"NEWDIR:*/covers:COVERS"

# Sitename is for the %sitename-cookie in announces :)
set sitename			"pzs-ng"
# Prefix on commands (f. x. !pnfree if cmdpre is !pn, !free if cmdpre is !, etc)
# bindnopre does not replace the cmd pre command, it meirly adds a second
# trigger option. example: you can set cmdpre to !pn but if bindnopre is set to # "YES" then the sitebot will respond to !pnbnc and also !bnc useful for rings.
set cmdpre			"!pn"
set bindnopre			"YES"
# List of bnc's (used for BNC-testing with the <prefix>bnc command in channel)
# Format: countrycode:hostname:port (space seperated)
set bnc(LIST)			"uk:msn.test1.com:123 de:msn.test2.com:345 se:msn.test3.com:567"
# Username and password to use for testing bncs (must exist with this box's ip added)
set bnc(USER)			"bncuser"
set bnc(PASS)			"bncpass"
# Number of seconds to wait before giving up on connecting to the BNCs (Note that SSL takes extra time)
set bnc(TIMEOUT)		"20"
# Should we make a ping test too? TRUE/FALSE
set bnc(PING)			"TRUE"

# Your sites bandwidth - used for % of bandwidth used calculations in !bw (in kilobytes)
# 100 mbit full duplex
set speed(INCOMING)		"12500"
set speed(OUTGOING)		"12500"
# 4096 / 1024 kbit asymmetric dsl
#set speed(INCOMING)		"512"
#set speed(OUTGOING)		"128"
# etc. ;)

# speed announces
# speed should be quoted in 'kb' (kilobytes), 'mb' (megabytes), 'kbit' (kilobits),
# 'mbit' (megabits), 'autobyte', 'autobit' or 'disabled'.
set speedmeasure		"autobyte"
# threshold used on auto-setting, to move from on to the other. (normally is 1000 or 1024)
set speedthreshold		1024

# During !idlers what is the minimum amount of seconds for a user to be shown as "idle"
# set to 0 to show all users who are not currently upload/downloading (may be a lot)
set minidletime			"30"

# What sections are we announcing for? (Remeber to define path and type below)
set sections			"TEST GAMES APPS MP3 0DAY MV"

# The sections we allow checking of stats on, remember that the number in
# parantheses must be the same as the number of the section in glftpd config =)
set statsection(0)		"MP3"
set statsection(1)		"0DAY"
set statsection(2)		"ISO"

# These are the binaries the script will use. They are usually best left
# as their default values :) (btw, check that they all are where they should
# and chmodded to eXecutable :) (chmod 755 <file>)
set binary(CAT)			"/glftpd/bin/cat"
set binary(WHO)			"/glftpd/bin/sitewho"
set binary(STATS)		"/glftpd/bin/stats"
set binary(PASSCHK)		"/glftpd/bin/passchk"
set binary(INCOMPLETE)		"/glftpd/bin/incomplete-list.sh"
set binary(PING)		"/bin/ping"
# ping in freebsd is in sbin
#set binary(PING)		"/sbin/ping"
set binary(NCFTPLS)		"/usr/local/bin/ncftpls"
set binary(DF)			"/bin/df"
# This is needed for autodetection of glversion. If you unset this, use_glftpd2
# MUST be set to YES or NO :)
set binary(GLFTPD)		"/glftpd/bin/glftpd"

# Definition of hd devices (for freespace) Syntax is "disk sections".
# 'sections' is purely for cosmetic uses (output)
set device(0)			"/dev/da0s1f MP3"
set device(1)			"/dev/ad0s1e ISO"
# Max length of devices before splitting to new line (note: you need to take
# the rest of the announce(FREE) into account yourself) Also, it'll output
# total on all lines, if you have multiple. Set it to 0 to disable.
set dev_max_length		300

# Set up paths for all the sections (wildcards) and their
# types. Types are to decide if things get shown or not ;)
set paths(TEST)			"/site/test/*"
set type(TEST)			"RACE"
set paths(GAMES)		"/site/incoming/games/*"
set type(GAMES)			"RACE"
set paths(APPS)			"/site/incoming/apps/*"
set type(APPS)			"RACE"
set paths(MP3)			"/site/incoming/mp3/*"
set type(MP3)			"RACE"
set paths(0DAY)			"/site/incoming/0day/*"
set type(0DAY)			"RACE"
set paths(MV)			"/site/incoming/musicvideos/*"
set type(MV)			"RACE"

# Which channels we announce the different things to.
# Space separated lists, you can have more than one channel :)
set mainchan						"#pzs-ng"
set chanlist(TEST)					"$mainchan"
set chanlist(GAMES)					"$mainchan"
set chanlist(APPS)					"$mainchan"
set chanlist(MP3)					"$mainchan"
set chanlist(0DAY)					"$mainchan"
set chanlist(MV)					"$mainchan"
set chanlist(DEFAULT)					"$mainchan"
set chanlist(INVITE)					"$mainchan"
set chanlist(WELCOME)					"$mainchan"

# Which channels we invite nicks to. (per default it invites
# to the channels it announces invites to, but you can change that)
set invite_channels					$chanlist(INVITE)

# Separate private/staff channel(s). For each channel you can define which
# groups and/or users should be invited. Please note that the code only looks at
# a users primary group when checking if he/she should be invited to a specific
# channel. If you have a STAFF member whose primary group is something else,
# then you need to list that user separately in the privusers list for the
# channel.
#set privchannel(STAFF)					"#pzs-ng_staff"
#set privgroups(STAFF)					"SiTEOPS STAFF"
#set privusers(STAFF)					"someuser1 someuser2"
#set privchannel(TECH)					"#pzs-ng_tech"
#set privgroups(TECH)					"STAFF"
#set privusers(TECH)					"someuser3 someuser4"

# Set to 0 to allow trigger commands in all channels bot is in,
# or set to 1 if you want the triggers to only work in $mainchan
set disable(TRIGINALLCHAN)				0

# Are we disabling the announce of this stuff?
# If its set to 1, we wont show it :)
set disable(BADBITRATE)					0
set disable(BADGENRE)					0
set disable(BADMSGINVITE)				0
set disable(BADYEAR)					0
set disable(COMPLETE_RAR)				0
set disable(COMPLETE_ZIP)				0
set disable(COMPLETE_OTHER)				0
set disable(COMPLETE_VIDEO)				0
set disable(COMPLETE_AUDIO_CBR)				0
set disable(COMPLETE_AUDIO_VBR)				0
set disable(COMPLETE_STAT_RACE_RAR)			0
set disable(COMPLETE_STAT_RACE_ZIP)			0
set disable(COMPLETE_STAT_RACE_OTHER)			0
set disable(COMPLETE_STAT_RACE_VIDEO)			0
set disable(COMPLETE_STAT_RACE_AUDIO_CBR)		0
set disable(COMPLETE_STAT_RACE_AUDIO_VBR)		0
set disable(DEBUG)					1
set disable(DEFAULT)					1
set disable(DELDIR)					0
set disable(DOUBLESFV)					0
set disable(HALFWAY_RACE_RAR)				0
set disable(HALFWAY_RACE_ZIP)				0
set disable(HALFWAY_RACE_OTHER)				0
set disable(HALFWAY_RACE_VIDEO)				0
set disable(HALFWAY_RACE_AUDIO)				0
set disable(HALFWAY_NORACE_RAR)				0
set disable(HALFWAY_NORACE_ZIP)				0
set disable(HALFWAY_NORACE_OTHER)			0
set disable(HALFWAY_NORACE_VIDEO)			0
set disable(HALFWAY_NORACE_AUDIO)			0
set disable(INCOMPLETE)					0
set disable(INVITE)					0
set disable(LOGIN)					1
set disable(LOGOUT)					1
set disable(TIMEOUT)					1
set disable(TAGLINE)					1
set disable(MSGINVITE)					0
set disable(NEWDIR)					0
set disable(NEWLEADER_RAR)				0
set disable(NEWLEADER_ZIP)				0
set disable(NEWLEADER_OTHER)				0
set disable(NEWLEADER_VIDEO)				0
set disable(NEWLEADER_AUDIO)				0
set disable(NUKE)					0
set disable(PRE)					0
set disable(RACE_RAR)					0
set disable(RACE_ZIP)					0
set disable(RACE_OTHER)					0
set disable(RACE_VIDEO)					0
set disable(RACE_AUDIO)					0
set disable(REQUEST)					0
set disable(REQFILLED)					0
set disable(SFV_RAR)					0
set disable(SFV_OTHER)					0
set disable(SFV_VIDEO)					0
set disable(SFV_AUDIO)					0
set disable(UNNUKE)					0
set disable(UPDATE_RAR)					0
set disable(UPDATE_OTHER)				0
set disable(UPDATE_CBR)					0
set disable(UPDATE_VBR)					0
set disable(UPDATE_VIDEO)				0
set disable(UPDATE_ZIP)					0
set disable(WELCOME)					0
set disable(WIPE)					0
set disable(WIPE-r)					0
set disable(BAD)					0
set disable(IMDB)					0
set disable(IMDBVAR)					0
set disable(IMDBFIND)					0
set disable(FAILLOGIN)					0
set disable(ALTWHO)					0

#########################################################
# ADVANCED CONFIG, EDIT CAREFULLY                       #
#########################################################

# Space separated list of wildcards that we match against
# paths to see if we announce it or not =)
# REMEMBER: This is CaSe SeNsItIvE.
set denypost						""

# Do not show it if this user gets nuked
set hidenuke						"UNKNOWN"

## Defining variables for announce
#
# Example:
#  set variables(PRE) "%pf %user %group %pregroup %files %mbytes"
#  set announce(PRE)  "-%sitename- \[%section\] %user@%group launches new %pregroup-pre called %release (%mbytesM in %filesF)"
#
# Special variables:
#  %pf       = path filter, must be the first parameter and contain full path of the release, it defines:
#   %reldir  = Last directory in path ( /site/xxx/marissa-exxtasy/cd1 => cd1 )
#   %path    = Second last directory in path ( /site/xxx/marissa-exxtasy/cd1 => marissa-exxtasy )
#   %relname = all directories after those defined in paths
#              ( paths(ISO) = "/site/xxx/" does: /site/xxx/marissa-exxtasy/cd1 => marissa-exxtasy/cd1 )
#
#  %bold    = bolds text
#  %uline   = underlines text
#  %section = current section name
#
#  %nuker   = name of nuker
#  %multiplier = nuke multiplier
#  %reason  = nuke reason
#  %nukee   = ppl that got nuked
#
# PLEASE! DO NOT CHANGE THESE VALUES IF YOU DO NOT KNOW WHAT THEY DO! IT *WILL* BREAK THE BOT!

## Read as:
# %t_ = Total, %t_files: Total files.
# %u_ = User, %u_count: User count.
# %g_ = Group, %g_name: Group name.

# Variables pasted from glftpd			<- moved to dZSbvars.tcl
# Variables pasted from the zipscript		<- moved to dZSbvars.tcl
# Variables pasted from 3rd party apps		<- moved to dZSbvars.tcl

set variables(PRE)		"%pf %releasename %pregroup %section %files %mbytes %cds %who %user %g_name %tagline"
set variables(INVITE)		"%u_ircnick %u_name %g_name"
set variables(REQUEST)		"%releasename %u_name %g_name %u_tagline"
set variables(REQFILLED)	"%releasename %u_name %g_name %u_tagline %u_requester"

# Using psxc-imdb, setting TRIGGER to "IMDBVAR" and LOGFORMAT to "SPECIAL" will allow you use format the output in the bot.
set variables(IMDBVAR)	"%pf %imdbdirname %imdburl %imdbtitle %imdbgenre %imdbrating %imdbcountry %imdblanguage %imdbcertification %imdbruntime %imdbdirector %imdbbusinessdata %imdbpremiereinfo %imdblimitedinfo %imdbvotes %imdbscore %imdbname %imdbyear %imdbnumscreens %imdbislimited %imdbcastleadname %imdbcastleadchar %imdbtagline %imdbplot %imdbbar %imdbcasting %imdbcommentshort %imdbdestination"

# Using psxc-imdb setting TRIGGER to "IMDB" and LOGFORMAT to "" or "MYOWN" will allow a pre-formatted output
set variables(IMDB)		"%pf %msg"

# Using psxc-imdb setting FINDTRIGGER to "IMDBFIND" and LOGFORMAT to "" or "MYOWN" will allow a pre-formatted output.
set variables(IMDBFIND)		"%pf %msg"

## Converts empty or zero variable to something else if defined
#
# Example:
#  set zeroconvert(%user) "NoOne"

# IMDB variables
set zeroconvert(%imdbdirname)		"N/A"
set zeroconvert(%imdburl)		"N/A"
set zeroconvert(%imdbtitle)		"N/A"
set zeroconvert(%imdbgenre)		"N/A"
set zeroconvert(%imdbrating)		"N/A"
set zeroconvert(%imdbcountry)		"N/A"
set zeroconvert(%imdblanguage)		"N/A"
set zeroconvert(%imdbcertification)	"N/A"
set zeroconvert(%imdbruntime)		"N/A"
set zeroconvert(%imdbdirector)		"N/A"
set zeroconvert(%imdbbusinessdata)	"N/A"
set zeroconvert(%imdbpremiereinfo)	"N/A"
set zeroconvert(%imdblimitedinfo)	"N/A"
set zeroconvert(%imdbvotes)		"Less than 5"
set zeroconvert(%imdbscore)		"0"
set zeroconvert(%imdbname)		"N/A"
set zeroconvert(%imdbyear)		"N/A"
set zeroconvert(%imdbnumscreens)	"N/A"
set zeroconvert(%imdbislimited)		"No idea."
set zeroconvert(%imdbcastleadname)	"Uknown"
set zeroconvert(%imdbcastleadchar)	"Uknown"
set zeroconvert(%imdbtagline)		"No info found."
set zeroconvert(%imdbplot)		"No info found."
set zeroconvert(%imdbbar)		".........."
set zeroconvert(%imdbcasting)		"N/A"
set zeroconvert(%imdbcommentshort)	"N/A"

## Splits output line to smaller pieces
#
# To disable set it to "\n"
set splitter(CHAR)				"|"

## RANDOMIZING OUTPUT
#
# Example:
#  set random(NEWDIR-0)       "-%sitename- \[%section\] + %user@%group creates a directory called %release"
#  set random(NEWDIR-1)       "-%sitename- \[%section\] + %user@%group makes a directory called %release"
#  set random(NEWDIR-2)       "-%sitename- \[%section\] + %user@%group does mkdir %release"
#   TYPE --------^   ^
#         ID --------^
#
#  set announce(NEWDIR) "random 3"
#   TYPE ---------^        ^    ^
#         RANDOM ----------^    ^
#             # OF IDS ---------^

# Announces are now set in announce(THEMEFILE). they can still be set here like you're used to, but it's deprecated.
set announce(THEMEFILE)				"themes/default.zst"

# In this announce you can use %free, %total and %used for the free/total/used sum of all disks
# and you can use %devices. Each device specified (see above (set device(0) etc)) will be inserted
# with stats as specified in announce(FREE-DEV) (see below)
#
# Stats for each device (Replaces %devices in announce(FREE) for each device), here you can use
# %free, %total and %used :)
# 2004-08-16: Layout of "FREE" has been moved to THEMEFILE. (avizion)
