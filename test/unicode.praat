echo Unicode
# Paul Boersma, June 18, 2007

assert length ("éééürtüéŋəü") = 11   ; precomposed (typed into ScriptEditor)
assert length ("éééürtüéŋəü") = 18   ; decomposed (copied from MacOS file icon)
assert "ɦɑlou" + "ɣujədɑx" = "ɦɑlouɣujədɑx"
assert left$ ("ɦɑlou", 3) = "ɦɑl"
assert "ɦɑl" <> "??l"
assert right$ ("ɣujədɑx", 5) = "jədɑx"
assert mid$ ("ɦɑlouɣujədɑx", 4, 5) = "ouɣuj"

# The text I/O commands ">", ">>", and "<":
filedelete kanweg.txt
text$ = "addd"
text$ > kanweg.txt
text$ < kanweg.txt
assert text$ = "addd"
text$ >> kanweg.txt
text$ < kanweg.txt
assert text$ = "adddaddd"   ; 'text$'

# ASCII appending:
filedelete kanweg.txt
fileappend kanweg.txt abc'newline$'
fileappend kanweg.txt def'newline$'
fileappend kanweg.txt ghi'newline$'
text$ < kanweg.txt
assert text$ = "abc" + newline$ + "def" + newline$ + "ghi" + newline$

# UTF-16 appending:
filedelete kanweg.txt
fileappend kanweg.txt åbc'newline$'
fileappend kanweg.txt dëf'newline$'
fileappend kanweg.txt ghi'newline$'
text$ < kanweg.txt
assert text$ = "åbc" + newline$ + "dëf" + newline$ + "ghi" + newline$

# Append to file first in ASCII, then change the encoding of the whole file to UTF-16:
filedelete kanweg.txt
fileappend kanweg.txt abc'newline$'
fileappend kanweg.txt dëf'newline$'
fileappend kanweg.txt ghi'newline$'
text$ < kanweg.txt
assert text$ = "abc" + newline$ + "dëf" + newline$ + "ghi" + newline$

# Unicode file names (precomposed source code):
assert length ("kanweg_abcåbçéü.txt") = 19   ; hopefully not 21
filedelete kanweg_abcåbçéü.txt
fileappend kanweg_abcåbçéü.txt hallo
filedelete kanweg_abcåbçéü.txt
fileappend kanweg_abcåbçéü.txt hallo
text$ < kanweg_abcåbçéü.txt
assert text$ = "hallo"

Read from file... åbçéü.wav
select Sound åbçéü
info$ = Info
header$ = left$ (info$, 20)
assert header$ = "Object: Sound åbçéü" + newline$   ; 'header$'
Remove

Create Strings as file list... list *.txt
n = Get number of strings
for i to n
	fileName$ = Get string... i
	assert right$ (fileName$, 4) = ".txt"
	length = length (fileName$)
	printline 'length' 'fileName$'
	if left$ (fileName$, 10) = "kanweg_abc"
		;assert fileName$ = "kanweg_abcåbçéü.txt"   ; 'fileName$'
	endif
endfor
Remove

printline OK