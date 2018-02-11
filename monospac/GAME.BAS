DECLARE SUB credits ()
DECLARE SUB showkeys ()
DECLARE SUB getready ()
DECLARE SUB clearobjects ()
DECLARE SUB wingame ()
DECLARE SUB dofadeout ()
DECLARE SUB initstatusvariables ()
DECLARE SUB doexplosionspawner (pindex%)
DECLARE SUB hugenuke (pindex%)
DECLARE SUB bossgung (pindex%)
DECLARE SUB dobosstopgun (pindex%)
DECLARE SUB dobossbotgun (pindex%)
DECLARE SUB cannong (pindex%)
DECLARE SUB dobossbotcannon (pindex%)
DECLARE SUB dobossbottompiece (pindex%)
DECLARE SUB dobossarmorplate (pindex%)
DECLARE SUB dobosstopcannon (pindex%)
DECLARE FUNCTION findobject% (pid%)
DECLARE SUB doboss (pindex%)
DECLARE SUB initlevelmusic ()
DECLARE SUB initmusicboss ()
DECLARE SUB checkstartmslsound ()
DECLARE SUB bigexpship ()
DECLARE SUB initlevelvariables ()
DECLARE FUNCTION finddelrequest% (pindex%)
DECLARE SUB clearnewpreserve ()
DECLARE SUB processaddrequests ()
DECLARE SUB reallyaddobject (pindex%)
DECLARE SUB clearaddrequests ()
DECLARE SUB playhitsound (pindex%)
DECLARE SUB doasteroid (pindex%)
DECLARE SUB bigdexpship ()
DECLARE SUB getasteroidframes (pindex%)
DECLARE SUB centreprint (pstring$)
DECLARE SUB waitkey ()
DECLARE SUB initgamevariables ()
DECLARE SUB doexitconditions ()
DECLARE SUB zap (pindex%)
DECLARE SUB setnewfloatobject (pindex%)
DECLARE SUB zapxy (px%, py%)
DECLARE SUB checkstopmislsound ()
DECLARE SUB channelshutoff (pchannel%)
DECLARE SUB limitcameray ()
DECLARE SUB camerayzero ()
DECLARE SUB restorecameray ()
DECLARE SUB poof (pindex%)
DECLARE SUB poofxy (px%, py%)
DECLARE SUB initcamvariables ()
DECLARE SUB cameratrackship ()
DECLARE SUB hitship (penergy%)
DECLARE SUB bigdamageexpxy (px%, py%)
DECLARE SUB bigdexpxy (px%, py%)
DECLARE SUB dieship ()
DECLARE SUB bigexpxy (px%, py%)
DECLARE SUB doenemy1 (pindex%)
DECLARE SUB floatlock (px1%, py1%, px2%, py2%, pvelocity!)
DECLARE SUB initmiscvariables ()
DECLARE SUB spawnbigdamageexp (pindex%)
DECLARE SUB bigdamageexp (pindex%)
DECLARE SUB cleanup ()
DECLARE SUB domissile (pindex%)
DECLARE SUB delsweapon (pindex%)
DECLARE SUB setdefaultcontrols ()
DECLARE SUB clearnew ()
DECLARE SUB starburst ()
DECLARE SUB getobjectshipnxy (pframe%)
DECLARE FUNCTION getshipframe% ()
DECLARE SUB addbox (px1%, py1%, px2%, py2%, pfill%)
DECLARE SUB drawboxesintobuf ()
DECLARE SUB clearboxes ()
DECLARE SUB SPRITEpn (ppstring$, px%, py%)
DECLARE SUB addsweapon (pname$, ammo%, ppower%, pmaxpower%, pfireoriginalcountdown%)
DECLARE FUNCTION findsweapon% (pname$)
DECLARE SUB errorexit (pstring$)
DECLARE SUB initcolvariables ()
DECLARE SUB SPRITEaddbobjects ()
DECLARE SUB limitshipenergy ()
DECLARE SUB addpowerup (pindex%, ppowerupchance%)
DECLARE SUB getobjectnxy (pindex%, pframe%)
DECLARE SUB addstatussprites ()
DECLARE SUB resetfmcard ()
DECLARE SUB hitobject (pindex%, penergy%)
DECLARE SUB bigexp (pindex%)
DECLARE FUNCTION pickchannel% (pn%)
DECLARE SUB hitmark (px%, py%)
DECLARE SUB adddelrequest (pindex%)
DECLARE SUB cleardelrequests ()
DECLARE SUB processdelrequests ()
DECLARE SUB FMPinit ()
DECLARE SUB loadsoundeffects ()
DECLARE SUB playgame ()
DECLARE SUB exitgame ()
DECLARE SUB addactionsprites ()
DECLARE SUB SPRITEaddship ()
DECLARE SUB SPRITEaddaobjects ()
DECLARE SUB addbgsprites ()
DECLARE SUB SPRITEaddstars ()
DECLARE SUB addobject ()
DECLARE SUB addsprite (px%, py%, pframe%, pid%)
DECLARE SUB adlport (adressreg%, bdata%)
DECLARE SUB channeloff (pchannel%)
DECLARE SUB clearsprites ()
DECLARE SUB continueplaysong ()
DECLARE SUB playnextsong ()
DECLARE SUB continuesfx ()
DECLARE SUB setchannel (pchannel%)
DECLARE SUB controlship ()
DECLARE SUB limitshipbounds ()
DECLARE SUB playsound (psoundeffectnumber%)
DECLARE SUB delobject (pindex%)
DECLARE SUB dolevel ()
DECLARE SUB levelend ()
DECLARE SUB doobjects ()
DECLARE SUB dostars ()
DECLARE SUB drawgraphics ()
DECLARE SUB vsync ()
DECLARE SUB FMPplaystart (pfilename$)
DECLARE SUB stopplaysong ()
DECLARE SUB getchan (pchannel%)
DECLARE SUB initplaybuffer ()
DECLARE SUB initship ()
DECLARE SUB initstars ()
DECLARE SUB initvariables ()
DECLARE SUB loadassembly ()
DECLARE SUB loadimx ()
DECLARE SUB loadlevel ()
DECLARE FUNCTION num$ (pint%)
DECLARE SUB offkb ()
DECLARE SUB onkb ()
DECLARE SUB playsong (pfilename$)
DECLARE SUB docollisions ()
DECLARE SUB processcollisions ()
DECLARE SUB playsoundL2 (pchannel%, psoundeffectnumber%)
DECLARE SUB copycurrentnew (pindex%)

'Acronyms:
'
'n/a = not applicable

CLS
SCREEN 7
COLOR 11
OPTION BASE 0

RANDOMIZE TIMER

'Define files
DIM SHARED imxfile$, levelfile$, soundfilename$, asmfile1$, asmfile2$, asmfile3$, asmfile4$, asmfile5$, songfile1$, songfile2$, songfile3$, scrfile0$, scrfile1$, scrfile2$, scrfile3$

imxfile$ = "monospac.imx"
levelfile$ = "level1.txt"
soundfilename$ = "monospac.sfx"
asmfile1$ = "engine7.rtn"
asmfile2$ = "keyboard.prg"
asmfile3$ = "collide3.rtn"
asmfile4$ = "box.rtn"
asmfile5$ = "blitbuf2.rtn"
songfile1$ = "maze12.fmp"
songfile2$ = "battle.fmp"
songfile3$ = "boss6.fmp"
scrfile0$ = "border.bp0"
scrfile1$ = "border.bp1"
scrfile2$ = "border.bp2"
scrfile3$ = "border.bp3"

DIM SHARED playbuffer$(10), playbufferpointer%

'Define constants
DIM SHARED MUSICQUIET
MUSICQUIET = 10
CONST MUSICON = 1
CONST PI = 3.141592
CONST SOUNDON = 1
CONST STARFIELDON = 1
CONST MAXSPRITES = 200
CONST MAXSTARS = 10 * STARFIELDON
CONST MAXCOLLISIONS = 1500
CONST MAXOBJECTS = 100
CONST MAXLEVELELEMENTS = 300
CONST VIDEOXSIZE = 320
CONST VIDEOYSIZE = 200
CONST STARMINX = -20
CONST CYCLESPERLEVELCOLUMN = 8
CONST MAXDELREQUESTS = 50
CONST STATUSREALY = 180
CONST MAXSWEAPONS = 30
CONST MAXBOXES = 20
CONST STATUSSHAKEAFTERHITDELAY = 35
CONST SHIPINVINCIBLEDELAY = 70
CONST KILLHITPOWER = 30000
CONST ASTEROIDSPINDELAY = 16
CONST MAXADDREQUESTS = 40
CONST ASTEROIDENERGY = 100
CONST METALCUBEENERGY = 200
CONST STARBURSTPOWER = 10
CONST DAMAGEEXPPOWER = 2
CONST SPACEYLIMIT = 200
CONST BOSSBODYENERGY = 1000
CONST BOSSAPPEARDELAY = 90
CONST BOSSADDBITEENEMYDELAY = 10
CONST BOSSPLATESWITCHOPENDELAY = 350
CONST BOSSPLATESWITCHCLOSEDELAY = 70
CONST BOSSADDASTEROIDDELAY = 30
CONST BOSSBOTTOMSWITCHOPENDELAY = 140
CONST BOSSBOTTOMSWITCHCLOSEDELAY = 140
CONST BOSSLASERSHOOTDELAY = 70
CONST BOSSGUNOFFDELAY = 210
CONST BOSSGUNONDELAY = 70
CONST BOSSGUNSHOTDELAY = 16
CONST BOSSYACCEL = .2
CONST EXPLOSIONSPAWNDELAY = 4
CONST BOSSMAXSPEED = 3

'Define types
TYPE spritetype
  x AS INTEGER
  y AS INTEGER
  frame AS INTEGER
  id AS INTEGER
END TYPE

TYPE startype
  x AS INTEGER
  y AS INTEGER
  frame AS INTEGER
  dx AS INTEGER
  parallax AS INTEGER
END TYPE

TYPE objecttype
  id AS INTEGER
  x AS INTEGER
  y AS INTEGER
  frame AS INTEGER
  dx AS INTEGER
  dy AS INTEGER
  cliptype AS INTEGER    'bit 0 = unused
                         'bit 1 = unused
                         'bit 2 = don't delete when out of x screen range
                         'bit 3 = don't delete when out of y screen range
                         'bit 4 = bounce off x edges
                         'bit 5 = bounce off y edges
  animmode AS INTEGER    '0 = none, 1 = cycle, 2 = ping pong, 3 = anim del
  animfirstframe AS INTEGER
  animlastframe AS INTEGER
  animcountdown AS INTEGER
  animoriginalcountdown AS INTEGER
  animdelta AS INTEGER   '0 = forward, 1 = backward
  life AS INTEGER
  energy AS INTEGER
  diemode AS INTEGER     '0 = disappear, 1 = blow up, 2 = poof,
                         '3 = zap explosion, 4 = huge nuke
  floaton AS INTEGER     '0 = off, 1 = on
  floatx AS SINGLE
  floaty AS SINGLE
  floatdx AS SINGLE
  floatdy AS SINGLE
  floatddx AS SINGLE
  floatddy AS SINGLE
  field1 AS INTEGER      'o specific fields
  field2 AS INTEGER
  field3 AS INTEGER
  field4 AS INTEGER
  field5 AS INTEGER
  field6 AS INTEGER
  field7 AS INTEGER
  field8 AS INTEGER
  field9 AS INTEGER
  field10 AS INTEGER
END TYPE

TYPE levelobjecttype
  appeardelay AS INTEGER
  y AS INTEGER
  id AS INTEGER
END TYPE

TYPE sweapontype
  weaponname AS STRING * 8
  ammo AS INTEGER       '(-1 = infinite)
  power AS INTEGER      '(0 = n/a)
  maxpower AS INTEGER   '(0 = n/a)
  firecountdown AS INTEGER
  fireoriginalcountdown AS INTEGER    '-1 = single shot / keypress
END TYPE

TYPE boxtype
  x1 AS INTEGER
  y1 AS INTEGER
  x2 AS INTEGER
  y2 AS INTEGER
  fill AS INTEGER
END TYPE

'Fm pipes player main section
CONST TOTALVOICES = 7
TYPE keybtype: flow AS INTEGER: fhi AS INTEGER: foct AS INTEGER: location AS INTEGER: END TYPE: TYPE voicetype: scancode AS INTEGER: inuse AS INTEGER: delay AS INTEGER: regB0 AS INTEGER: END TYPE
DIM SHARED adlportasm%(512), keyb(128) AS keybtype, totalkeys%, voice(9) AS voicetype, setoldinstrumentsflag%, currentsong$
DIM SHARED kbmatrix2%(257), currentkbmatrix2%(257), oldkbmatrix2%(257), transpose%, playbuffer&(425), playbufferindex&, recordbufferindex&, recorddelaycounter&, playdelaycounter&, keycount&, keyindex&, recordmode%, playmode%
keyDATA:
DATA 0,0,0,0,0,0,0,0,0,0,0,0,21,1,5,27,55,1,5,25,0,0,0,0,114,1,5,22,159,1,5,20,210,1,5,18,0,0,0,0,21,1,6,15,55,1,6,13,0,0,0,0,114,1,6,10,210,1,6,6,238,1,4,29,6,1,5,28,38,1,5,26,74,1,5,24,93,1,5,23,136,1,5,21,184,1,5,19,238,1,5,17,6,1,6,16
DATA 38,1,6,14,74,1,6,12,93,1,6,11,136,1,6,9,184,1,6,7,0,0,0,0,0,0,0,0,21,1,4,39,55,1,4,37,0,0,0,0,114,1,4,34,159,1,4,32,210,1,4,30,0,0,0,0,21,1,5,27,55,1,5,25,93,1,5,23,210,1,4,30,238,1,3,41,159,1,6,8,6,1,4,40,38,1,4,38,74,1,4,36,93,1,4,35
DATA 136,1,4,33,184,1,4,31,238,1,4,29,6,1,5,28,38,1,5,26,74,1,5,24,93,1,5,23,0,0,0,0,0,0,0,0,0,0,0,0,210,1,3,42,-1,-1,-1,-1
adlportDATA:
DATA 85,137,229,80,83,81,82,30,86,6,87,190,6,0,177,4,54,139,26,139,7,54,137,2,70,70,254,201,117,242,22,31,139,86,10,138,70,6,238,185,6,0,236,73,117,252,139,86,12,138,70,8,238,139,86,10,185,35,0,236
DATA 73,117,252,95,7,94,31,90,89,91,88,137,236,93,202,8,-1
FMPinit

'Sound effects variables
DIM SHARED sfx%(2048), totalsounds%, version%, sfxdelaycountdown%(9), sfxpointer&(9), sfxpriority%(9), sfxnumber%(9)
DIM SHARED sfxduration&(9), sfxeventcountdown%(9), sfxoldregister%(9), modulator%, carrier%
loadsoundeffects

'Define arrays
DIM SHARED imx%(7250), engine%(2048), kbcontrol%(512), kbmatrix%(257), keyboardon%, blitbuf2%(128), sprite(MAXSPRITES) AS spritetype, totalsprites%, doublebuffer%(4096), collidertn%(256), collisionarray%(1, MAXCOLLISIONS)
DIM SHARED totalcollisions%, highestcollisions%, boxrtn%(256)

'Game variables
DIM SHARED difficulty%, gameenddelay%, gameendflag%

'Status variables
DIM SHARED statusshakecountdown%, bossonscreen%

'Ship tracking variables
DIM SHARED shipx%, shipy%
DIM SHARED shipsize%        'Ranges (0-3)
DIM SHARED shipspeed%       'Ranges (0-2)
DIM SHARED shipxtronfiredelay%, shipxtronfiredelaycount%, xtronpower%
DIM SHARED shipenergy%, shipspeedup%, shipinvinciblecountdown%
DIM SHARED score&, lives%

'Ship control variables
DIM SHARED upkey%, rightkey%, downkey%, leftkey%
DIM SHARED firenormalweaponbutton%, specialweaponbutton%
DIM SHARED oldspecialweaponbuttonstatus%
DIM SHARED shipmode%                      '0 = on screen, 1 = not on screen

'Camera tracking variables
DIM SHARED floatcameray, cameray%, oldcameray%

'Background tracking variables
DIM SHARED star(MAXSTARS) AS startype

'o tracking variables
DIM SHARED o(MAXOBJECTS) AS objecttype, totalobjects%
DIM SHARED addrequest(MAXADDREQUESTS) AS objecttype, totaladdrequests%
DIM SHARED delrequest%(MAXDELREQUESTS), totaldelrequests%
DIM SHARED new AS objecttype, preservenew%
DIM SHARED nx%, ny%

'Level tracking variables
DIM SHARED levelobject(MAXLEVELELEMENTS) AS levelobjecttype
DIM SHARED totallevelobjects%, levelparsecountdown&, levelindex%
DIM SHARED appeardelaycount%

'Special weapon variables
DIM SHARED sweapon(MAXSWEAPONS) AS sweapontype
DIM SHARED totalsweapons%, currentsweapon%

'Box o variables
DIM SHARED box(MAXBOXES) AS boxtype
DIM SHARED totalboxes%

'Misc variables
DIM SHARED bulletvelocity, fadeout%, checkpointlevelindex%, message$

setdefaultcontrols
showkeys
playgame
exitgame

SUB addactionsprites
SPRITEaddship
SPRITEaddaobjects
END SUB

SUB addbgsprites
SPRITEaddstars
SPRITEaddbobjects
END SUB

SUB addbox (px1%, py1%, px2%, py2%, pfill%)
i% = totalboxes%
box(i%).x1 = px1%
box(i%).y1 = py1%
box(i%).x2 = px2%
box(i%).y2 = py2%
box(i%).fill = pfill%
totalboxes% = i% + 1
END SUB

SUB adddelrequest (pindex%)
i% = totaldelrequests%
IF i% < MAXDELREQUESTS THEN
  f% = 0
  FOR i1% = 0 TO i% - 1
    IF delrequest%(i1%) = pindex% THEN
      f% = 1
    END IF
  NEXT
  IF f% = 0 THEN
    delrequest%(i%) = pindex%
    i% = i% + 1
  END IF
ELSE
  errorexit "Out of delete requests memory!"
END IF
totaldelrequests% = i%
END SUB

SUB addobject
IF new.animmode THEN
  new.frame = new.animfirstframe
  IF (new.id <> 16) THEN
    new.animcountdown = new.animoriginalcountdown
  ELSE
    new.animcountdown = 0
  END IF
END IF
IF new.floaton THEN
  new.x = new.floatx
  new.y = new.floaty
END IF
i% = totaladdrequests%
IF i% >= MAXADDREQUESTS THEN errorexit "Out of add requests memory!"
FOR n% = 0 TO totaladdrequests% - 1
  IF (addrequest(n%).id = new.id) AND (addrequest(n%).x = new.x) AND (addrequest(n%).y = new.y) AND (addrequest(n%).dx = new.dx) AND (addrequest(n%).dy = new.dy) AND (addrequest(n%).floatdx = new.floatdx) AND (addrequest(n%).floatdy = new.floatdy) THEN
    clearnewpreserve
    EXIT SUB
  END IF
NEXT
addrequest(i%).id = new.id
addrequest(i%).x = new.x
addrequest(i%).y = new.y
addrequest(i%).frame = new.frame
addrequest(i%).dx = new.dx
addrequest(i%).dy = new.dy
addrequest(i%).cliptype = new.cliptype
addrequest(i%).animmode = new.animmode
addrequest(i%).animfirstframe = new.animfirstframe
addrequest(i%).animlastframe = new.animlastframe
addrequest(i%).animcountdown = new.animcountdown
addrequest(i%).animoriginalcountdown = new.animoriginalcountdown
addrequest(i%).animdelta = new.animdelta
addrequest(i%).life = new.life
addrequest(i%).energy = new.energy
addrequest(i%).diemode = new.diemode
addrequest(i%).floaton = new.floaton
addrequest(i%).floatx = new.x
addrequest(i%).floaty = new.y
addrequest(i%).floatdx = new.floatdx
addrequest(i%).floatdy = new.floatdy
addrequest(i%).floatddx = new.floatddx
addrequest(i%).floatddy = new.floatddy
addrequest(i%).field1 = new.field1
addrequest(i%).field2 = new.field2
addrequest(i%).field3 = new.field3
addrequest(i%).field4 = new.field4
addrequest(i%).field5 = new.field5
addrequest(i%).field6 = new.field6
addrequest(i%).field7 = new.field7
addrequest(i%).field8 = new.field8
addrequest(i%).field9 = new.field9
addrequest(i%).field10 = new.field10
totaladdrequests% = i% + 1
clearnewpreserve
END SUB

'Powerup flags (f%)
'1 = add powerup
'2 = add powerup chance * 2
'3 = add 3 powerups
SUB addpowerup (pindex%, f%)
dx% = -1
dy% = -1
ch% = 1
SELECT CASE f%
  CASE 2
    ch% = 2
  CASE 3
    ch% = 2
    GOSUB reallyaddpowerup
    dy% = 1
    GOSUB reallyaddpowerup
    dy% = 0
    dx% = 1
END SELECT
GOSUB reallyaddpowerup
EXIT SUB

reallyaddpowerup:
n% = INT(RND * ((difficulty% + 1) * (10 \ ch%)))
'test code
'n% = 1
'end -> test code
SELECT CASE n%
  CASE 0: GOSUB addenergypowerup
  CASE 1: GOSUB addmissilepowerup
END SELECT
RETURN

addenergypowerup:
f% = 38
new.id = 5
GOSUB powerupg
RETURN

addmissilepowerup:
f% = 39
new.id = 6
GOSUB powerupg
RETURN

powerupg:
getobjectnxy pindex%, f%
new.x = nx%
new.y = ny%
new.frame = f%
new.cliptype = 32
new.dx = dx%
new.dy = dy%
addobject
RETURN

END SUB

SUB addsprite (px%, py%, pframe%, pid%)
IF totalsprites% = MAXSPRITES THEN EXIT SUB
i% = totalsprites%
sprite(i%).x = px%
sprite(i%).y = py% - cameray%
sprite(i%).frame = pframe%
sprite(i%).id = pid%
totalsprites% = i% + 1
END SUB

SUB addstatussprites
IF shipmode% THEN EXIT SUB
camerayzero
GOSUB shakestatus
GOSUB drawenergystatus
GOSUB drawspecialweaponstatus
GOSUB drawscore
GOSUB drawlives
IF bossonscreen% THEN GOSUB drawbossenergy
restorecameray
EXIT SUB

drawenergystatus:
addsprite statusx%, statusy%, 35, 0
FOR x% = 0 TO shipenergy% - 1
  addsprite ((x% * 4) + 12 + statusx%), statusy% + 2, 36, 0
NEXT
t% = shipenergy%
IF t% > 15 THEN t% = 15
FOR x% = 0 TO (t% \ 4) - 1
  addsprite ((x% * 16) + 28 + statusx%), statusy% + 1, 37, 0
NEXT
RETURN

drawspecialweaponstatus:
IF totalsweapons% = 0 THEN RETURN
i% = currentsweapon%
t$ = num$(currentsweapon% + 1) + "/" + num$(totalsweapons%)
SPRITEpn t$, 160, statusy%
SPRITEpn sweapon(i%).weaponname, 192, statusy%
IF sweapon(i%).ammo = -1 THEN
  addsprite 244 + statusx%, statusy%, 77, 0
ELSE
  t$ = num$(sweapon(i%).ammo)
  SPRITEpn t$, 244, statusy%
END IF
IF sweapon(i%).power > 0 THEN
  x1% = 192 + statusx%
  xs = (sweapon(i%).power / sweapon(i%).maxpower) * 52
  x2% = x1% + INT(xs)
  y% = statusy% - 2
  addbox x1%, y%, x2%, y%, 1
END IF
RETURN

shakestatus:
statusx% = 0
statusy% = STATUSREALY
IF statusshakecountdown% > 0 THEN
  statusshakecountdown% = statusshakecountdown% - 1
  statusx% = statusx% + INT(RND * 3) - 1
  statusy% = statusy% + INT(RND * 3) - 1
END IF
RETURN

drawpowergage:
f% = 98
FOR x% = 0 TO 112 STEP 27
  addsprite statusx% + x%, statusy% + 8, f%, 0
  f% = f% + 1
NEXT
addsprite statusx% + x%, statusy% + 8, f%, 0
addsprite statusx% + x% + 9, statusy% + 8, f% + 1, 0
RETURN

drawbossenergy:
i% = findobject%(18)
IF i% > -1 THEN
  xs% = o(i%).energy / BOSSBODYENERGY * 50
  IF xs% > 0 THEN addbox 0, 190, xs%, 190, 1
  addsprite 2 + xs%, 188, 138, 0
END IF
RETURN

drawscore:
t$ = MID$(STR$(score&), 2, LEN(STR$(score&)) - 1)
SPRITEpn t$, 320 - (LEN(t$) * 6), statusy%
RETURN

drawlives:
addsprite 120, statusy%, 139, 0
SPRITEpn "x", 128, statusy%
t$ = num$(lives% - 1)
SPRITEpn t$, 136, statusy%
RETURN

END SUB

SUB addsweapon (pname$, ammo%, ppower%, pmaxpower%, pfireoriginalcountdown%)
IF i% >= MAXSWEAPONS THEN errorexit "Out of special weapon space!"
i% = totalsweapons%
sweapon(i%).weaponname = pname$
sweapon(i%).ammo = ammo%
sweapon(i%).power = ppower%
sweapon(i%).maxpower = pmaxpower%
sweapon(i%).firecountdown = 0
sweapon(i%).fireoriginalcountdown = pfireoriginalcountdown%
totalsweapons% = i% + 1
END SUB

SUB adlport (adressreg%, bdata%)
DEF SEG = VARSEG(adlportasm%(0))
p1% = &H389
p2% = &H388
p3% = bdata%
p4% = adressreg%
CALL ABSOLUTE(p1%, p2%, p3%, p4%, 0)
DEF SEG
END SUB

SUB bigdamageexp (pindex%)
f% = 15
getobjectnxy pindex%, f%
bigdamageexpxy nx%, ny%
playsound 4
END SUB

SUB bigdamageexpxy (px%, py%)
new.id = 10
new.animoriginalcountdown = 1
new.animfirstframe = 15
new.animlastframe = 34
new.animmode = 3
new.x = px%
new.y = py%
addobject
END SUB

SUB bigdexpship
getobjectshipnxy 15
bigdexpxy nx%, ny%
END SUB

SUB bigdexpxy (px%, py%)
new.id = 10
new.animoriginalcountdown = 1
new.animfirstframe = 15
new.animlastframe = 34
new.animmode = 3
new.x = px%
new.y = py% - 20
preservenew% = 1
addobject
new.x = px% - 30
new.y = py% + 10
preservenew% = 1
addobject
new.x = px% + 30
new.y = py% + 10
addobject
END SUB

SUB bigexp (pindex%)
f% = 15
getobjectnxy pindex%, f%
bigexpxy nx%, ny%
playsound 4
END SUB

SUB bigexpship
getobjectshipnxy 15
bigexpxy nx%, ny%
END SUB

SUB bigexpxy (px%, py%)
new.id = 4
new.animoriginalcountdown = 1
new.animfirstframe = 15
new.animlastframe = 34
new.animmode = 3
new.x = px%
new.y = py%
addobject
END SUB

SUB bossgung (pindex%)
i% = pindex%
o(i%).field1 = o(i%).field1 - 1
IF o(i%).field1 <= 0 THEN
  o(i%).field2 = o(i%).field2 XOR 1
  SELECT CASE o(i%).field2
    CASE 0
      o(i%).field1 = BOSSGUNOFFDELAY
      o(i%).field3 = 0
    CASE 1
      o(i%).field1 = BOSSGUNONDELAY
      o(i%).field3 = 0
  END SELECT
END IF
IF o(i%).field2 THEN
  o(i%).field3 = o(i%).field3 - 1
  IF o(i%).field3 <= 0 THEN
    o(i%).field3 = BOSSGUNSHOTDELAY
    f% = 89
    getobjectnxy i%, f%
    new.id = 11
    new.animmode = 1
    new.animfirstframe = f%
    new.animlastframe = 92
    new.animoriginalcountdown = 3
    new.life = 200
    new.diemode = 2
    floatlock nx%, ny%, shipx%, shipy%, bulletvelocity
    addobject
  END IF
END IF

END SUB

SUB cameratrackship
y = shipy%
f% = getshipframe%
ys = imx%(imx%(8 + f%) + 1)
y = y + ys \ 2
dify = (y - 100) - floatcameray
floatcameray = floatcameray + dify * .2
cameray% = floatcameray
limitcameray
END SUB

SUB camerayzero
oldcameray% = cameray%
cameray% = 0
END SUB

SUB cannong (pindex%)
i% = pindex%
o(i%).field1 = o(i%).field1 - 1
IF o(i%).field1 <= 0 THEN
  o(i%).field1 = BOSSLASERSHOOTDELAY
  new.id = 23
  new.x = o(i%).x
  new.y = o(i%).y + 5
  new.dx = -8
  new.frame = 137
  addobject
END IF
END SUB

SUB centreprint (pstring$)
y% = CSRLIN
x% = 40 - LEN(pstring$) \ 2
LOCATE y%, x%
IF y% < 23 THEN
  PRINT pstring$
ELSE
  PRINT pstring$;
END IF
END SUB

SUB channeloff (pchannel%)
IF pchannel% < 7 OR pchannel% > 8 THEN
  errorexit "Sound effect channel out of range"
END IF
adlport &HB0 + pchannel%, sfxoldregister%(pchannel%) AND (255 - 32)
sfxpriority%(pchannel%) = 0
sfxdelaycountdown%(pchannel%) = 0
sfxnumber%(pchannel%) = -1
END SUB

SUB channelshutoff (pchannel%)
getchan pchannel%
adlport &HB0 + pchannel%, sfxoldregister%(pchannel%) AND (255 - 32)
adlport &H80 + modulator%, &HFF
adlport &H80 + carrier%, &HFF
END SUB

SUB checkstartmslsound
IF sfxnumber%(8) = -1 THEN
  f% = 0
  FOR i% = 0 TO totalobjects% - 1
    IF o(i%).id = 8 THEN f% = 1: EXIT FOR
  NEXT
  IF f% THEN playsound 6
END IF
END SUB

SUB checkstopmislsound
IF sfxnumber%(8) = 6 THEN
  f% = 1
  FOR i% = 0 TO totalobjects% - 1
    IF o(i%).id = 8 THEN f% = 0: EXIT FOR
  NEXT
  IF f% THEN channeloff 8
END IF
END SUB

SUB cleanup
IF (MUSICON = 1) OR (SOUNDON = 1) THEN stopplaysong
offkb
END SUB

SUB clearaddrequests
totaladdrequests% = 0
END SUB

SUB clearboxes
totalboxes% = 0
END SUB

SUB cleardelrequests
totaldelrequests% = 0
END SUB

SUB clearnew
new.id = 0
new.x = 0
new.y = 0
new.frame = 0
new.dx = 0
new.dy = 0
new.cliptype = 0
new.animmode = 0
new.animfirstframe = 0
new.animlastframe = 0
new.animcountdown = 0
new.animoriginalcountdown = 0
new.life = 0
new.energy = 0
new.diemode = 0
new.floaton = 0
new.floatx = 0
new.floaty = 0
new.floatdx = 0
new.floatdy = 0
new.floatddx = 0
new.floatddy = 0
new.field1 = 0
new.field2 = 0
new.field3 = 0
new.field4 = 0
new.field5 = 0
new.field6 = 0
new.field7 = 0
new.field8 = 0
new.field9 = 0
new.field10 = 0
END SUB

SUB clearnewpreserve
IF preservenew% = 0 THEN
clearnew
ELSE
preservenew% = 0
END IF
END SUB

SUB clearobjects
totalobjects% = 0
END SUB

SUB clearsprites
totalsprites% = 0
addsprite 0, 0, 140, 0
END SUB

SUB continueplaysong
IF playmode% = 0 THEN EXIT SUB
FOR n% = 0 TO TOTALVOICES - 1
voice(n%).delay = voice(n%).delay + 1
IF voice(n%).delay > 32000 THEN voice(n%).delay = 32000
NEXT
DO WHILE kbmatrix2%(128) > 0
saveflag% = 0
keycode% = kbmatrix2%(128 + kbmatrix2%(128))
originalkeycode% = keycode%
kbmatrix2%(128) = kbmatrix2%(128) - 1
IF keycode% > 127 THEN
keycode% = keycode% - 128
IF keycode% < totalkeys% THEN
saveflag% = 1
voicenumber% = -1
FOR n% = 0 TO TOTALVOICES - 1
IF voice(n%).scancode = keycode% THEN voicenumber% = n%
NEXT
IF voicenumber% = -1 THEN GOTO FMPskip2
byte% = voice(voicenumber%).regB0
byte% = byte% AND (255 - 32)
adlport &HB0 + voicenumber%, byte%
flag% = 1
FOR n% = 0 TO TOTALVOICES - 1
IF n% <> voicenumber% THEN
IF voice(n%).inuse = 1 AND (keyb(voice(n%).scancode).location = keyb(voice(voicenumber%).scancode).location) THEN flag% = 0
END IF
NEXT
voice(voicenumber%).delay = 0
voice(voicenumber%).inuse = 0
FMPskip2:
END IF
GOTO keyrespondSKIP0
ELSE
IF keycode% < totalkeys% THEN
flag% = 1
FOR n% = 0 TO TOTALVOICES - 1
IF voice(n%).inuse = 1 THEN
IF voice(n%).scancode = keycode% THEN flag% = 0
END IF
NEXT
IF flag% = 1 THEN
saveflag% = 1
unused% = -1
FOR n% = 0 TO TOTALVOICES - 1
IF voice(n%).inuse = 0 THEN unused% = n%
NEXT
largest% = 0
IF unused% = -1 THEN
voicenumber% = -1
FOR n% = 0 TO TOTALVOICES - 1
IF voice(n%).delay > largest% THEN
largest% = voice(n%).delay
voicenumber% = n%
END IF
NEXT
ELSE
voicenumber% = -1
FOR n% = 0 TO TOTALVOICES - 1
IF voice(n%).inuse = 0 THEN
IF voice(n%).delay > largest% THEN
largest% = voice(n%).delay
voicenumber% = n%
END IF
END IF
NEXT
END IF
voice(voicenumber%).scancode = keycode%
voice(voicenumber%).delay = 0
voice(voicenumber%).inuse = 1
scan% = voice(voicenumber%).scancode
lobyte% = keyb(scan%).flow
hibyte% = keyb(scan%).fhi
fr = lobyte% + (hibyte% * 256)
FOR n% = 0 TO 4
fr = fr * 1.05946
NEXT
ffr% = INT(fr)
lobyte% = ffr% AND 255
hibyte% = INT(ffr% / 256)
hibyte% = hibyte% OR ((keyb(scan%).foct + transpose%) * 4)
hibyte% = hibyte% OR 32
adlport &HA0 + voicenumber%, lobyte%
adlport &HB0 + voicenumber%, hibyte%
voice(voicenumber%).regB0 = hibyte%
END IF
GOTO keyrespondSKIP0
END IF
END IF
SELECT CASE keycode%
CASE 74
saveflag% = 1
transpose% = transpose% - 1
IF transpose% < -4 THEN transpose% = -4
CASE 78
saveflag% = 1
transpose% = transpose% + 1
IF transpose% > 1 THEN transpose% = 1
END SELECT
keyrespondSKIP0:
keyrespondSKIP1:
LOOP
FOR n% = 0 TO TOTALVOICES - 1
IF voice(n%).inuse = 1 THEN
IF kbmatrix2%(voice(n%).scancode) = 0 THEN
byte% = voice(n%).regB0
byte% = byte% AND (255 - 32)
adlport &HB0 + n%, byte%
flag% = 1
FOR n2% = 0 TO TOTALVOICES - 1
IF n2% <> n% THEN
IF voice(n2%).inuse = 1 AND (keyb(voice(n2%).scancode).location = keyb(voice(n%).scancode).location) THEN flag% = 0
END IF
NEXT
voice(n%).delay = 0
voice(n%).inuse = 0
END IF
END IF
NEXT
GOSUB fmkeysDOPLAY
EXIT SUB

fmkeysDOPLAY:
playdelaycounter& = playdelaycounter& + 1
BACK0:
DEF SEG = VARSEG(playbuffer&(0))
IF playdelaycounter& >= PEEK(playbufferindex&) THEN
i% = PEEK(playbufferindex& + 1)
n% = kbmatrix2%(128)
kbmatrix2%(n% + 129) = i%
kbmatrix2%(128) = n% + 1
IF i% < 128 THEN
kbmatrix2%(i%) = 1
ELSE
kbmatrix2%(i% - 128) = 0
END IF
DEF SEG
keyindex& = keyindex& + 1
IF keyindex& >= playbuffer&(3) THEN playnextsong
playbufferindex& = playbufferindex& + 2
playdelaycounter& = 0
IF playmode% = 1 THEN GOTO BACK0
END IF
DEF SEG
RETURN

END SUB

SUB continuesfx
FOR n% = 0 TO 8
  IF sfxdelaycountdown%(n%) > 0 THEN
    sfxduration&(n%) = sfxduration&(n%) + 1
    sfxdelaycountdown%(n%) = sfxdelaycountdown%(n%) - 1
    IF sfxdelaycountdown%(n%) <= 0 THEN
      sfxeventcountdown%(n%) = sfxeventcountdown%(n%) - 1
      IF sfxeventcountdown%(n%) < 0 THEN
        channeloff n%
      ELSE
        setchannel n%
        sfxpointer&(n%) = sfxpointer&(n%) + 16
      END IF
    END IF
  END IF
NEXT
END SUB

SUB controlship
GOSUB getshipsize
GOSUB moveship
GOSUB firespecial
GOSUB firenormal
GOSUB shipcountdowninvincible
EXIT SUB

firenormal:
IF kbmatrix%(firenormalweaponbutton%) THEN
  GOSUB dofirextron
ELSE
  shipxtronfiredelaycount% = 0
END IF
RETURN

dofirextron:
t% = shipxtronfiredelaycount%
t% = t% - 1
IF t% <= 0 THEN
  playsound 2
  t% = shipxtronfiredelay%
  new.id = 1
  new.dx = 12
  new.dy = 0
  new.animmode = 1
  new.animfirstframe = 10
  new.animlastframe = 11
  new.animoriginalcountdown = 2
  SELECT CASE shipsize%
    CASE 0: GOSUB addlittleshipxtron
    CASE 1: GOSUB addmediumshipxtron
    CASE 2: GOSUB addfastshipxtron
    CASE 3: GOSUB addbigshipxtron
  END SELECT
END IF
shipxtronfiredelaycount% = t%
RETURN

addlittleshipxtron:
new.x = shipx% + 5
new.y = shipy% + 4
addobject
RETURN

addmediumshipxtron:
new.x = shipx%
new.y = shipy% + 1
preservenew% = 1
addobject
new.x = shipx%
new.y = shipy% + 10
addobject
RETURN

addfastshipxtron:
new.x = shipx% + 6
new.y = shipy%
preservenew% = 1
addobject
new.x = shipx% + 18
new.y = shipy% + 7
preservenew% = 1
addobject
new.x = shipx% + 5
new.y = shipy% + 7
new.dy = 4
addobject
RETURN

addbigshipxtron:
new.x = shipx% - 4
new.y = shipy%
preservenew% = 1
addobject
new.x = shipx% + 18
new.y = shipy% + 7
preservenew% = 1
addobject
new.x = shipx% - 5
new.y = shipy% + 11
preservenew% = 1
new.dy = 4
addobject
new.x = shipx% - 4
new.y = shipy% + 2
new.dy = -4
addobject
RETURN

dospecialweapon:
IF totalsweapons% = 0 THEN RETURN
i% = currentsweapon%
IF sweapon(i%).fireoriginalcountdown = -1 THEN
  IF (oldspecialweaponbuttonstatus% = 0) THEN
    GOSUB firespecialweapon
  END IF
ELSE
  sweapon(i%).firecountdown = sweapon(i%).firecountdown - 1
  IF sweapon(i%).firecountdown <= 0 THEN
    sweapon(i%).firecountdown = sweapon(i%).fireoriginalcountdown
    GOSUB firespecialweapon
  END IF
END IF
RETURN

firespecialweapon:
t$ = sweapon(i%).weaponname
IF MID$(t$, 1, 7) = "missile" THEN
  playsound 6
  new.id = 8
  f% = 8
  getobjectshipnxy f%
  new.floatx = nx% + 16
  new.floaty = ny%
  new.frame = f%
  new.floaton = 1
  new.floatdx = 2
  new.floatddx = .1
  new.field2 = 4
  SELECT CASE shipsize%
    CASE 1
      new.floatdy = -1
      preservenew% = 1
      addobject
      new.floatdy = -new.floatdy
    CASE 2
      preservenew% = 1
      addobject
      new.floatdx = new.floatdx * .7
      new.floatdy = -1
      preservenew% = 1
      addobject
      new.floatdy = -new.floatdy
    CASE 3
      preservenew% = 1
      addobject
      new.floatdx = new.floatdx * .7
      new.floatdy = -2
      preservenew% = 1
      addobject
      new.floatdy = -new.floatdy
      preservenew% = 1
      addobject
      new.floatdy = -new.floatdy * .5
      new.floatdx = new.floatdx * 1.2
      preservenew% = 1
      addobject
      new.floatdy = -new.floatdy
  END SELECT
  addobject
END IF
IF sweapon(i%).ammo > 0 THEN sweapon(i%).ammo = sweapon(i%).ammo - 1
IF sweapon(i%).ammo = 0 THEN
  delsweapon i%
END IF
RETURN

moveship:
dx% = 0
dy% = 0
SELECT CASE shipspeedup%
  CASE 0
    vx% = 1
    vy% = 1
  CASE 1
    vx% = 3
    vy% = 2
  CASE 2
    vx% = 5
    vy% = 4
END SELECT
IF kbmatrix%(upkey%) THEN dy% = dy% - vy%
IF kbmatrix%(rightkey%) THEN dx% = dx% + vx%
IF kbmatrix%(downkey%) THEN dy% = dy% + vy%
IF kbmatrix%(leftkey%) THEN dx% = dx% - vx%
dx% = dx% * (shipspeed% + 1)
dy% = dy% * (shipspeed% + 1)
shipx% = shipx% + dx%
shipy% = shipy% + dy%
limitshipbounds
RETURN

getshipsize:
shipsize% = ((shipenergy% - 1) \ 4)
RETURN

firespecial:
IF kbmatrix%(specialweaponbutton%) THEN
  GOSUB dospecialweapon
ELSE
  IF totalsweapons% > 0 THEN sweapon(currentsweapon%).firecountdown = 0
END IF
oldspecialweaponbuttonstatus% = kbmatrix%(specialweaponbutton%)
RETURN

shipcountdowninvincible:
IF shipinvinciblecountdown% > 0 THEN
  shipinvinciblecountdown% = shipinvinciblecountdown% - 1
END IF
RETURN

END SUB

SUB copycurrentnew (pindex%)
i% = pindex%
new.id = o(i%).id
new.x = o(i%).x
new.y = o(i%).y
new.frame = o(i%).frame
new.dx = o(i%).dx
new.dy = o(i%).dy
new.cliptype = o(i%).cliptype
new.animmode = o(i%).animmode
new.animfirstframe = o(i%).animfirstframe
new.animlastframe = o(i%).animlastframe
new.animcountdown = o(i%).animcountdown
new.animoriginalcountdown = o(i%).animoriginalcountdown
new.life = o(i%).life
new.energy = o(i%).energy
new.diemode = o(i%).diemode
new.floaton = o(i%).floaton
new.floatx = o(i%).floatx
new.floaty = o(i%).floaty
new.floatdx = o(i%).floatdx
new.floatdy = o(i%).floatdy
new.floatddx = o(i%).floatddx
new.floatddy = o(i%).floatddy
new.field1 = o(i%).field1
new.field2 = o(i%).field2
new.field3 = o(i%).field3
new.field4 = o(i%).field4
new.field5 = o(i%).field5
new.field6 = o(i%).field6
new.field7 = o(i%).field7
new.field8 = o(i%).field8
new.field9 = o(i%).field9
new.field10 = o(i%).field10
END SUB

SUB credits
SCREEN 9
CLS
COLOR 11
LOCATE 2, 1

centreprint "Congratulations!!!   The Galaxy is saved!!!   AWESOME!!!"
PRINT
centreprint "score: " + num$(INT(score&))
PRINT
centreprint "Credits:"
PRINT
centreprint "Game design: Milo Sedlacek (a.k.a. gradius)"
centreprint "Gameplay advisor: Lukas Sedlacek"
PRINT
centreprint "Thanks for letting me use the computer of:"
centreprint "Lukas Sedlacek"
centreprint "Andrew Sedlacek"
centreprint "Shawn Bradley"
PRINT
centreprint "Hi to my coding buddies:"
centreprint "Jeff Jones (a.k.a. ShadSoft)"
centreprint "Ryan Ross  (a.k.a. GamerX)"
centreprint "Lukas Sedlacek"
centreprint "Shawn Bradley"
centreprint "Michal Guerquin (a.k.a. tek_hed)"
centreprint "Trevor Lovett (a.k.a. Neander)"
centreprint "YOU!"
LOCATE 25, 1
centreprint "Be sure to hang on: EF-NET #quickbasic"


MUSICQUIET = 0
playbuffer$(0) = songfile2$
playbuffer$(1) = ""
IF MUSICON THEN playsong playbuffer$(0)
DO
  a$ = INKEY$
  vsync
  IF MUSICON THEN continueplaysong
LOOP WHILE a$ = ""
END SUB

SUB delobject (pindex%)
i% = totalobjects%
i% = i% - 1
IF (i% <> pindex%) THEN
o(pindex%).id = o(i%).id
o(pindex%).x = o(i%).x
o(pindex%).y = o(i%).y
o(pindex%).frame = o(i%).frame
o(pindex%).dx = o(i%).dx
o(pindex%).dy = o(i%).dy
o(pindex%).cliptype = o(i%).cliptype
o(pindex%).animmode = o(i%).animmode
o(pindex%).animfirstframe = o(i%).animfirstframe
o(pindex%).animlastframe = o(i%).animlastframe
o(pindex%).animcountdown = o(i%).animcountdown
o(pindex%).animoriginalcountdown = o(i%).animoriginalcountdown
o(pindex%).animdelta = o(i%).animdelta
o(pindex%).life = o(i%).life
o(pindex%).energy = o(i%).energy
o(pindex%).diemode = o(i%).diemode
o(pindex%).floaton = o(i%).floaton
o(pindex%).floatx = o(i%).floatx
o(pindex%).floaty = o(i%).floaty
o(pindex%).floatdx = o(i%).floatdx
o(pindex%).floatdy = o(i%).floatdy
o(pindex%).floatddx = o(i%).floatddx
o(pindex%).floatddy = o(i%).floatddy
o(pindex%).field1 = o(i%).field1
o(pindex%).field2 = o(i%).field2
o(pindex%).field3 = o(i%).field3
o(pindex%).field4 = o(i%).field4
o(pindex%).field5 = o(i%).field5
o(pindex%).field6 = o(i%).field6
o(pindex%).field7 = o(i%).field7
o(pindex%).field8 = o(i%).field8
o(pindex%).field9 = o(i%).field9
o(pindex%).field10 = o(i%).field10
END IF
totalobjects% = i%
END SUB

SUB delsweapon (pindex%)
i% = totalsweapons% - 1
IF (i% = -1) THEN errorexit "Total special weapons = -1"
sweapon(pindex%).weaponname = sweapon(i%).weaponname
sweapon(pindex%).ammo = sweapon(i%).ammo
sweapon(pindex%).power = sweapon(i%).power
sweapon(pindex%).maxpower = sweapon(i%).maxpower
sweapon(pindex%).firecountdown = sweapon(i%).firecountdown
sweapon(pindex%).fireoriginalcountdown = sweapon(i%).fireoriginalcountdown
totalsweapons% = i%
END SUB

SUB dieship
shipmode% = 1
bigdexpship
bigdamageexpxy nx%, ny%
playsound 4
gameenddelay% = 100
END SUB

SUB doasteroid (pindex%)
getasteroidframes pindex%
END SUB

SUB doboss (pindex%)
i% = pindex%
o(i%).field2 = o(i%).field2 - 1
IF o(i%).field2 <= 0 THEN
  o(i%).field2 = 30000
  SELECT CASE o(i%).field1
    CASE 0
      o(i%).field1 = 1
      o(i%).floatdx = 0
  END SELECT
END IF
IF o(i%).field1 THEN
  dy = BOSSYACCEL
  IF (o(i%).y + 20) > shipy% THEN dy = -dy
  o(i%).floatdy = o(i%).floatdy + dy
  IF o(i%).floatdy > BOSSMAXSPEED THEN o(i%).floatdy = BOSSMAXSPEED
  IF o(i%).floatdy < -BOSSMAXSPEED THEN o(i%).floatdy = -BOSSMAXSPEED
END IF
END SUB

SUB dobossarmorplate (pindex%)
i% = pindex%
i1% = findobject%(18)
IF i1% > -1 THEN
  o(i%).x = o(i1%).x - 2 + (o(i%).field1 \ 2)
  o(i%).y = o(i1%).y + 2 - (o(i%).field1 \ 2)
ELSE
  hitobject i%, KILLHITPOWER
END IF
SELECT CASE o(i%).field2
  CASE 0
    o(i%).field1 = o(i%).field1 - 1
    IF o(i%).field1 < 0 THEN o(i%).field1 = 0
  CASE 1
    o(i%).field1 = o(i%).field1 + 1
    IF o(i%).field1 > 20 THEN o(i%).field1 = 20
END SELECT
o(i%).field3 = o(i%).field3 - 1
IF o(i%).field3 <= 0 THEN
  o(i%).field2 = o(i%).field2 XOR 1
  IF o(i%).field2 = 1 THEN
    o(i%).field4 = 0
    o(i%).field3 = BOSSPLATESWITCHCLOSEDELAY
  ELSE
    o(i%).field3 = BOSSPLATESWITCHOPENDELAY
  END IF
END IF
IF (o(i%).field2 = 1) AND (o(i%).field1 = 20) THEN
  o(i%).field4 = o(i%).field4 - 1
  IF o(i%).field4 <= 0 THEN
    o(i%).field4 = BOSSADDBITEENEMYDELAY
    new.id = 13
    new.dx = -3
    new.x = o(i1%).x
    new.y = o(i1%).y
    new.energy = 10
    new.diemode = 3
    new.animmode = 1
    new.animfirstframe = 93
    new.animlastframe = 94
    new.animoriginalcountdown = 5
    addobject
  END IF
END IF
END SUB

SUB dobossbotcannon (pindex%)
i% = pindex%
i1% = findobject%(21)
IF i1% > -1 THEN
  o(i%).x = o(i1%).x + 3
  o(i%).y = o(i1%).y + 5
ELSE
  hitobject i%, KILLHITPOWER
END IF
cannong i%
END SUB

SUB dobossbotgun (pindex%)
i% = pindex%
i1% = findobject%(21)
IF i1% > -1 THEN
  o(i%).x = o(i1%).x - 8
  o(i%).y = o(i1%).y + 2
ELSE
  hitobject i%, KILLHITPOWER
END IF
bossgung i%
END SUB

SUB dobossbottompiece (pindex%)
i% = pindex%
i1% = findobject%(18)
IF i1% > -1 THEN
  o(i%).x = o(i1%).x + 10
  o(i%).y = o(i1%).y + 22 + (o(i%).field1 \ 3)
ELSE
  hitobject i%, KILLHITPOWER
END IF
SELECT CASE o(i%).field2
  CASE 0
    o(i%).field1 = o(i%).field1 - 1
    IF o(i%).field1 < 0 THEN o(i%).field1 = 0
  CASE 1
    o(i%).field1 = o(i%).field1 + 1
    IF o(i%).field1 > 66 THEN o(i%).field1 = 66
END SELECT
o(i%).field3 = o(i%).field3 - 1
IF o(i%).field3 <= 0 THEN
  o(i%).field2 = o(i%).field2 XOR 1
  IF o(i%).field2 = 1 THEN
    o(i%).field4 = 0
    o(i%).field3 = BOSSBOTTOMSWITCHCLOSEDELAY
  ELSE
    o(i%).field3 = BOSSBOTTOMSWITCHOPENDELAY
  END IF
END IF
IF (o(i%).field2 = 1) AND (o(i%).field1 = 66) THEN
  o(i%).field4 = o(i%).field4 - 1
  IF o(i%).field4 <= 0 THEN
    o(i%).field4 = BOSSADDASTEROIDDELAY
      new.id = 16
      new.x = o(i1%).x + 35
      new.y = o(i1%).y + 21
      new.animmode = 1
      new.animoriginalcountdown = ASTEROIDSPINDELAY
      new.energy = ASTEROIDENERGY
      new.field1 = 3
      floatlock new.x, new.y, shipx%, shipy%, 3
      addobject
  END IF
END IF
END SUB

SUB dobosstopcannon (pindex%)
i% = pindex%
i1% = findobject%(18)
IF i1% > -1 THEN
  o(i%).x = o(i1%).x + 12
  o(i%).y = o(i1%).y - 13
ELSE
  hitobject i%, KILLHITPOWER
END IF
cannong i%
END SUB

SUB dobosstopgun (pindex%)
i% = pindex%
i1% = findobject%(20)
IF i1% > -1 THEN
  o(i%).x = o(i1%).x - 6
  o(i%).y = o(i1%).y + 2
ELSE
  hitobject i%, KILLHITPOWER
END IF
bossgung i%
END SUB

SUB docollisions
totalcollisions% = 0
IF totalsprites% < 2 THEN EXIT SUB
Ttotalsprites% = totalsprites%
returnvalue% = 0
DEF SEG = VARSEG(collidertn%(0))
CALL ABSOLUTE(VARSEG(collisionarray%(0, 0)), VARPTR(collisionarray%(0, 0)), VARSEG(sprite(0).x), VARPTR(sprite(0).x), VARSEG(imx%(0)), VARPTR(imx%(0)), Ttotalsprites%, returnvalue%, 0)
DEF SEG
totalcollisions% = returnvalue%
END SUB

SUB doenemy1 (pindex%)
i% = pindex%
GOSUB enemy1shoot
GOSUB enemy1sway
EXIT SUB

enemy1shoot:
o(i%).field1 = o(i%).field1 - 1
IF o(i%).field1 <= 0 THEN
  o(i%).field1 = o(i%).field2
  f% = 89
  getobjectnxy pindex%, f%
  new.id = 11
  new.animmode = 1
  new.animfirstframe = f%
  new.animlastframe = 92
  new.animoriginalcountdown = 3
  new.life = 200
  new.diemode = 2
  floatlock nx%, ny%, shipx%, shipy%, bulletvelocity
  addobject
END IF
RETURN

enemy1sway:
  o(i%).floatdy = SIN(o(i%).floatx / 50)
RETURN

END SUB

SUB doexitconditions
IF kbmatrix%(1) THEN gameendflag% = 1
IF gameenddelay% > 0 THEN
  gameenddelay% = gameenddelay% - 1
  IF gameenddelay% = 0 THEN
    lives% = lives% - 1
    IF lives% <= 0 THEN
      message$ = "GAME OVER"
      exitgame
    END IF
    levelindex% = checkpointlevelindex%
    levelparsecountdown& = 0
    appeardelaycount% = 0
    clearobjects
    getready
    initship
    initcamvariables
  END IF
END IF
END SUB

SUB doexplosionspawner (pindex%)
i% = pindex%
o(i%).field1 = o(i%).field1 - 1
IF o(i%).field1 <= 0 THEN
  o(i%).field1 = EXPLOSIONSPAWNDELAY
  bigexp i%
END IF
END SUB

SUB dofadeout
IF fadeout% THEN
  IF findobject%(26) = -1 THEN
    y1% = (fadeout% \ 4)
    y2% = 199 - (fadeout% \ 4)
    LINE (0, y1% - 1)-(319, y1% - 1), 0
    LINE (0, y1%)-(319, y1%), 15
    LINE (0, y2%)-(319, y2%), 15
    LINE (0, y2% + 1)-(399, y2% + 1), 0
    fadeout% = fadeout% + 2
    IF fadeout% > 399 THEN
      wingame
    END IF
  END IF
END IF
END SUB

SUB dolevel
t& = levelparsecountdown&
t& = t& - 1
IF t& <= 0 THEN
  t& = CYCLESPERLEVELCOLUMN
  d% = appeardelaycount%
  i% = levelindex%
  DO WHILE (levelobject(i%).appeardelay <= d%) AND (i% < totallevelobjects%)
    d% = 0
    y% = levelobject(i%).y
    id% = levelobject(i%).id
    new.x = 320
    new.y = y%
    SELECT CASE id%
      CASE 0          'Enemy 1
        new.id = 2
        new.floaton = 1
        new.floatx = new.x
        new.floaty = new.y
        new.floatdx = -2
        new.frame = 12
        new.energy = 30
        new.diemode = 1
        new.field2 = 50 - (difficulty% * 10)
        new.field1 = new.field2
        addobject
      CASE 1          'Enemy 2
        new.id = 13
        new.dx = -3
        new.energy = 10
        new.diemode = 3
        new.animmode = 1
        new.animfirstframe = 93
        new.animlastframe = 94
        new.animoriginalcountdown = 5
        addobject
      CASE 2          'Check point
        new.id = 15
        new.dx = -3
        new.frame = 105
        addobject
        checkpointlevelindex% = levelindex%
      CASE 3          'Asteroid
        new.id = 16
        new.dx = -1
        new.cliptype = 32
        new.animmode = 1
        new.animoriginalcountdown = ASTEROIDSPINDELAY
        new.energy = ASTEROIDENERGY
        new.field1 = 3
        addobject
      CASE 4          'Metal cube
        new.id = 17
        new.dx = -2
        new.animmode = 1
        new.animfirstframe = 118
        new.animlastframe = 129
        new.animoriginalcountdown = 2
        new.energy = METALCUBEENERGY
        new.diemode = 1
        addobject
      CASE 5
        IF MUSICON THEN
          initmusicboss
          playsong playbuffer$(playbufferpointer%)
        END IF
      CASE 6
        new.id = 5
        new.dx = -5
        new.frame = 38
        new.cliptype = 32
        addobject
      CASE 7
        new.id = 6
        new.dx = -5
        new.frame = 39
        new.cliptype = 32
        addobject
      CASE 8
        'Add boss body
        new.id = 18
        new.floatx = new.x
        new.floaty = new.y
        new.floaton = 1
        new.floatdx = -1
        new.frame = 130
        new.energy = BOSSBODYENERGY
        new.field1 = 0
        new.field2 = BOSSAPPEARDELAY
        new.cliptype = 12
        new.diemode = 4
        addobject
        'Add boss top cannon
        new.id = 19
        new.frame = 131
        new.energy = 200
        new.field1 = BOSSLASERSHOOTDELAY
        new.cliptype = 12
        new.diemode = 1
        addobject
        'Add boss armor plate
        new.id = 20
        new.frame = 135
        new.energy = 200
        new.field3 = BOSSPLATESWITCHOPENDELAY
        new.cliptype = 12
        new.diemode = 1
        addobject
        'Add boss bottom piece
        new.id = 21
        new.frame = 136
        new.energy = 100
        new.field3 = BOSSBOTTOMSWITCHOPENDELAY
        new.cliptype = 12
        new.diemode = 1
        addobject
        'Add boss bottom cannon
        new.id = 22
        new.frame = 132
        new.energy = 200
        new.field1 = BOSSLASERSHOOTDELAY
        new.cliptype = 12
        new.diemode = 1
        addobject
        'Add boss bottom gun
        new.id = 24
        new.frame = 134
        new.energy = 100
        new.field1 = BOSSGUNOFFDELAY
        new.cliptype = 12
        new.diemode = 1
        addobject
        'Add boss top gun
        new.id = 25
        new.frame = 133
        new.energy = 100
        new.field1 = BOSSGUNOFFDELAY
        new.cliptype = 12
        new.diemode = 1
        addobject
        bossonscreen% = 1
      END SELECT
    i% = i% + 1
  LOOP
  levelindex% = i%
  d% = d% + 1
  appeardelaycount% = d%
END IF
levelparsecountdown& = t&
IF i% = totallevelobjects% THEN levelend
clearnew
END SUB

SUB domissile (pindex%)
i% = pindex%
o(i%).field1 = o(i%).field1 - 1
IF o(i%).field1 <= 0 THEN
  o(i%).field1 = o(i%).field2
  f% = 79
  getobjectnxy i%, f%
  new.id = 9
  new.x = nx% - 8
  new.y = ny%
  new.dx = -3
  new.animmode = 3
  new.animfirstframe = f%
  new.animlastframe = f% + 9
  new.animoriginalcountdown = 4
  addobject
END IF
END SUB

SUB doobjects
n% = 0
DO WHILE n% < totalobjects%
  'Specific
  SELECT CASE o(n%).id
    CASE 2: doenemy1 n%
    CASE 8: domissile n%
    CASE 16: doasteroid n%
    CASE 18: doboss n%
    CASE 19: dobosstopcannon n%
    CASE 20: dobossarmorplate n%
    CASE 21: dobossbottompiece n%
    CASE 22: dobossbotcannon n%
    CASE 24: dobossbotgun n%
    CASE 25: dobosstopgun n%
    CASE 26: doexplosionspawner n%
  END SELECT
  'General
  IF o(n%).floaton THEN
    o(n%).floatx = o(n%).floatx + o(n%).floatdx
    o(n%).floaty = o(n%).floaty + o(n%).floatdy
    o(n%).floatdx = o(n%).floatdx + o(n%).floatddx
    o(n%).floatdy = o(n%).floatdy + o(n%).floatddy
    o(n%).x = o(n%).floatx
    o(n%).y = o(n%).floaty
  ELSE
    o(n%).x = o(n%).x + o(n%).dx
    o(n%).y = o(n%).y + o(n%).dy
  END IF
  xs% = imx%(imx%(8 + o(n%).frame))
  ys% = imx%(imx%(8 + o(n%).frame) + 1)
  IF (o(n%).x < 0) THEN
    IF (o(n%).cliptype AND 16) THEN
      o(n%).x = 0
      o(n%).dx = -o(n%).dx
    END IF
  END IF
  IF (o(n%).x + xs% > VIDEOXSIZE) THEN
    IF (o(n%).cliptype AND 16) THEN
      o(n%).x = VIDEOXSIZE - xs%
      o(n%).dx = -o(n%).dx
    END IF
  END IF
  IF (o(n%).y < -SPACEYLIMIT) THEN
    IF (o(n%).cliptype AND 32) THEN
      o(n%).y = -SPACEYLIMIT
      o(n%).dy = -o(n%).dy
    END IF
  END IF
  IF (o(n%).y + ys% > (200 + SPACEYLIMIT)) THEN
    IF (o(n%).cliptype AND 32) THEN
      o(n%).y = (200 + SPACEYLIMIT) - ys%
      o(n%).dy = -o(n%).dy
    END IF
  END IF
  IF (o(n%).cliptype AND 4) = 0 THEN
    IF (o(n%).x + xs%) < 0 THEN adddelrequest n%
    IF (o(n%).x - xs%) > (VIDEOXSIZE - 1) THEN adddelrequest n%
  END IF
  IF (o(n%).cliptype AND 8) = 0 THEN
    IF (o(n%).y + ys%) < -SPACEYLIMIT THEN adddelrequest n%
    IF (o(n%).y - ys%) >= (200 + SPACEYLIMIT) THEN adddelrequest n%
  END IF
  IF o(n%).animmode > 0 THEN
    o(n%).animcountdown = o(n%).animcountdown - 1
    IF o(n%).animcountdown <= 0 THEN
      o(n%).animcountdown = o(n%).animoriginalcountdown
      GOSUB animobjectdelta
      IF o(n%).frame < o(n%).animfirstframe THEN
        o(n%).frame = o(n%).animfirstframe
        SELECT CASE o(n%).animmode
          CASE 1: o(n%).frame = o(n%).animlastframe
          CASE 2
            o(n%).animdelta = o(n%).animdelta XOR 1
            GOSUB animobjectdelta
          CASE 3
            adddelrequest n%
        END SELECT
      END IF
      IF o(n%).frame > o(n%).animlastframe THEN
        o(n%).frame = o(n%).animlastframe
        SELECT CASE o(n%).animmode
          CASE 1: o(n%).frame = o(n%).animfirstframe
          CASE 2
            o(n%).animdelta = o(n%).animdelta XOR 1
            GOSUB animobjectdelta
          CASE 3
            adddelrequest n%
        END SELECT
      END IF
    END IF
  END IF
  IF o(n%).life > 0 THEN
    o(n%).life = o(n%).life - 1
    IF o(n%).life = 0 THEN
      hitobject n%, KILLHITPOWER
    END IF
  END IF
  n% = n% + 1
LOOP
EXIT SUB

animobjectdelta:
SELECT CASE o(n%).animdelta
  CASE 0: o(n%).frame = o(n%).frame + 1
  CASE 1: o(n%).frame = o(n%).frame - 1
END SELECT
RETURN

END SUB

SUB dostars
FOR i% = 0 TO MAXSTARS - 1
  star(i%).x = star(i%).x + star(i%).dx
  IF star(i%).x < STARMINX THEN star(i%).x = VIDEOXSIZE
NEXT
END SUB

SUB drawboxesintobuf
DEF SEG = VARSEG(boxrtn%(0))
FOR i% = 0 TO totalboxes% - 1
  x1% = box(i%).x1
  y1% = box(i%).y1
  x2% = box(i%).x2
  y2% = box(i%).y2
  fill% = box(i%).fill
  CALL ABSOLUTE(VARSEG(doublebuffer%(0)), VARPTR(doublebuffer%(0)), x1%, y1%, x2%, y2%, fill%, 0)
NEXT
DEF SEG
clearboxes
END SUB

SUB drawgraphics
IF totalsprites% = 0 THEN EXIT SUB
vsync
s& = VARSEG(doublebuffer%(0))
o1& = VARPTR(doublebuffer%(0))
DEF SEG = VARSEG(engine%(0))
CALL ABSOLUTE(s&, o1&, 0)
t% = totalsprites%: IF t% > 0 THEN CALL ABSOLUTE(s&, o1&, VARSEG(sprite(0).x), VARPTR(sprite(0).x), VARSEG(imx%(0)), VARPTR(imx%(0)), t%, 4)
DEF SEG
drawboxesintobuf
DEF SEG = VARSEG(blitbuf2%(0))
y% = (fadeout% \ 4)
y2% = 200 - (fadeout% \ 4)
CALL ABSOLUTE(0, 0, y%, y2%, s&, o1&, 0)
DEF SEG
clearsprites
END SUB

SUB errorexit (pstring$)
cleanup
COLOR 15
LOCATE 1, 1
PRINT pstring$
END
END SUB

SUB exitgame
cleanup
SCREEN 0
WIDTH 80, 25
COLOR 7, 0
CLS
PRINT message$
SYSTEM
END SUB

SUB fieldDOC

'id         field descriptions

'2 - enemy 1
'field 1    shoot countdown
'field 2    shoot original countdown

'8 - missile
'field 1    trail drop countdown
'field 2    trail drop original countdown

'16 - asteroid
'field 1    size of asteroid (3 = big, 2 = medium, 1 = small)

'18 - boss body
'field 1    mode - (0 = appearing, 1 = standing)
'field 2    mode delay countdown

'19 - boss bottom cannon
'field 1    laser shoot countdown

'20 - boss plate
'field 1    plate position (0-20)
'field 2    plate tending mode (0 = towards close, 1 = towards open)
'field 3    tending mode switch countdown
'field 4    add bite enemy countdown

'21 - boss plate
'field 1    bottom position (0-66)
'field 2    bottom tending mode (0 = towards close, 1 = towards open)
'field 3    tending mode switch countdown
'field 4    add asteroid countdown

'22 - boss bottom cannon
'field 1    laser shoot countdown

'24 - boss top gun
'field 1    mode switch countdown
'field 2    mode (0 = not firing, 1 = firing)
'field 3    gun shot countdown

'25 - boss bottom gun
'field 1    mode switch countdown
'field 2    mode (0 = not firing, 1 = firing)
'field 3    gun shot countdown

'26 - explosion spawner
'field 1    spawn explosion countdown

END SUB

FUNCTION finddelrequest% (pindex%)
f% = 0
FOR n% = 0 TO totaldelrequests% - 1
  IF delrequest%(n%) = pindex% THEN f% = 1: EXIT FOR
NEXT
finddelrequest% = f%
END FUNCTION

FUNCTION findobject% (pid%)
FOR i% = 0 TO totalobjects% - 1
  IF o(i%).id = pid% THEN findobject% = i%: EXIT FUNCTION
NEXT
findobject% = -1
END FUNCTION

FUNCTION findsweapon% (pname$)
DIM tempstring2 AS STRING * 8
tempstring2 = pname$
FOR i% = 0 TO totalsweapons% - 1
  IF sweapon(i%).weaponname = tempstring2 THEN
    GOTO skip3
  END IF
NEXT
i% = -1
skip3:
findsweapon% = i%
END FUNCTION

SUB floatlock (px1%, py1%, px2%, py2%, pvelocity)
new.floaton = 1
new.floatx = px1%
new.floaty = py1%
x1 = px1%
y1 = py1%
x2 = px2%
y2 = py2%
difx = x2 - x1
dify = y2 - y1
IF ABS(difx) <> 0 THEN
  angle = ATN(dify / difx)
  IF difx > 0 THEN
    angle = angle + PI
  END IF
  dx = -COS(angle) * pvelocity
  dy = -SIN(angle) * pvelocity
ELSE
  dx = -pvelocity
  dy = 0
END IF
new.floatdx = dx
new.floatdy = dy
END SUB

SUB FMPinit
RESTORE keyDATA
index% = 0
GOTO FMPINITskip0
DO
keyb(index%).flow = a%
keyb(index%).fhi = b%
keyb(index%).foct = c%
keyb(index%).location = d%
index% = index% + 1
FMPINITskip0:
READ a%, b%, c%, d%
LOOP UNTIL a% = -1
totalkeys% = index%
RESTORE adlportDATA
DEF SEG = VARSEG(adlportasm%(0))
i% = VARPTR(adlportasm%(0))
GOTO FMPINITskip1
DO
POKE i%, q%
i% = i% + 1
FMPINITskip1:
READ q%
LOOP UNTIL q% = -1
DEF SEG
END SUB

SUB FMPplaystart (pfilename$)
DEF SEG = VARSEG(playbuffer&(0))
BLOAD pfilename$, 0
DEF SEG
poffset& = 0
psegment& = VARSEG(playbuffer&(0))
resetfmcard
DEF SEG = psegment&
byte% = PEEK(0 + poffset&)
basead% = &H20
adlport basead% + 0, byte%
adlport basead% + 1, byte%
adlport basead% + 2, byte%
adlport basead% + 8, byte%
adlport basead% + 9, byte%
adlport basead% + 10, byte%
adlport basead% + 16, byte%
adlport basead% + 17, byte%
adlport basead% + 18, byte%
DEF SEG = psegment&
byte% = PEEK(1 + poffset&)
basead% = &H20
adlport basead% + 3, byte%
adlport basead% + 4, byte%
adlport basead% + 5, byte%
adlport basead% + 11, byte%
adlport basead% + 12, byte%
adlport basead% + 13, byte%
adlport basead% + 19, byte%
adlport basead% + 20, byte%
adlport basead% + 21, byte%
DEF SEG = psegment&
byte% = PEEK(2 + poffset&)
basead% = &H40
adlport basead% + 0, byte%
adlport basead% + 1, byte%
adlport basead% + 2, byte%
adlport basead% + 8, byte%
adlport basead% + 9, byte%
adlport basead% + 10, byte%
adlport basead% + 16, byte%
adlport basead% + 17, byte%
adlport basead% + 18, byte%
DEF SEG = psegment&
byte% = PEEK(3 + poffset&)
v% = (byte% AND 63)
v% = v% + MUSICQUIET
IF v% > 63 THEN v% = 63
byte% = byte% AND (255 - 63)
byte% = byte% OR v%
basead% = &H40
adlport basead% + 3, byte%
adlport basead% + 4, byte%
adlport basead% + 5, byte%
adlport basead% + 11, byte%
adlport basead% + 12, byte%
adlport basead% + 13, byte%
adlport basead% + 19, byte%
adlport basead% + 20, byte%
adlport basead% + 21, byte%
DEF SEG = psegment&
byte% = PEEK(4 + poffset&)
basead% = &H60
adlport basead% + 0, byte%
adlport basead% + 1, byte%
adlport basead% + 2, byte%
adlport basead% + 8, byte%
adlport basead% + 9, byte%
adlport basead% + 10, byte%
adlport basead% + 16, byte%
adlport basead% + 17, byte%
adlport basead% + 18, byte%
DEF SEG = psegment&
byte% = PEEK(5 + poffset&)
basead% = &H60
adlport basead% + 3, byte%
adlport basead% + 4, byte%
adlport basead% + 5, byte%
adlport basead% + 11, byte%
adlport basead% + 12, byte%
adlport basead% + 13, byte%
adlport basead% + 19, byte%
adlport basead% + 20, byte%
adlport basead% + 21, byte%
DEF SEG = psegment&
byte% = PEEK(6 + poffset&)
basead% = &H80
adlport basead% + 0, byte%
adlport basead% + 1, byte%
adlport basead% + 2, byte%
adlport basead% + 8, byte%
adlport basead% + 9, byte%
adlport basead% + 10, byte%
adlport basead% + 16, byte%
adlport basead% + 17, byte%
adlport basead% + 18, byte%
DEF SEG = psegment&
byte% = PEEK(7 + poffset&)
basead% = &H80
adlport basead% + 3, byte%
adlport basead% + 4, byte%
adlport basead% + 5, byte%
adlport basead% + 11, byte%
adlport basead% + 12, byte%
adlport basead% + 13, byte%
adlport basead% + 19, byte%
adlport basead% + 20, byte%
adlport basead% + 21, byte%
DEF SEG = psegment&
byte% = PEEK(8 + poffset&)
basead% = &HE0
adlport basead% + 0, byte%
adlport basead% + 1, byte%
adlport basead% + 2, byte%
adlport basead% + 8, byte%
adlport basead% + 9, byte%
adlport basead% + 10, byte%
adlport basead% + 16, byte%
adlport basead% + 17, byte%
adlport basead% + 18, byte%
DEF SEG = psegment&
byte% = PEEK(9 + poffset&)
basead% = &HE0
adlport basead% + 3, byte%
adlport basead% + 4, byte%
adlport basead% + 5, byte%
adlport basead% + 11, byte%
adlport basead% + 12, byte%
adlport basead% + 13, byte%
adlport basead% + 19, byte%
adlport basead% + 20, byte%
adlport basead% + 21, byte%
DEF SEG = psegment&
byte% = PEEK(10 + poffset&)
basead% = &HC0
adlport basead%, byte%
adlport basead% + 1, byte%
adlport basead% + 2, byte%
adlport basead% + 3, byte%
adlport basead% + 4, byte%
adlport basead% + 5, byte%
adlport basead% + 6, byte%
adlport basead% + 7, byte%
adlport basead% + 8, byte%
DEF SEG
DEF SEG = VARSEG(playbuffer&(0))
transpose% = PEEK(11) - 4
DEF SEG
IF transpose% < -4 THEN transpose% = -4
IF transpose% > 1 THEN transpose% = 1
playmode% = 1
keyindex& = 0
playdelaycounter& = 0
playbufferindex& = 16
IF playbuffer&(3) = 0 THEN stopplaysong
END SUB

SUB getasteroidframes (pindex%)
SELECT CASE o(pindex%).field1
  CASE 1
    f% = 106
    l% = 109
  CASE 2
    f% = 110
    l% = 113
  CASE 3
    f% = 114
    l% = 117
END SELECT
o(pindex%).animfirstframe = f%
o(pindex%).animlastframe = l%
END SUB

SUB getchan (pchannel%)
SELECT CASE pchannel%
CASE 0: m% = 0: c% = 3
CASE 1: m% = 1: c% = 4
CASE 2: m% = 2: c% = 5
CASE 3: m% = 8: c% = 11
CASE 4: m% = 9: c% = 12
CASE 5: m% = 10: c% = 13
CASE 6: m% = 16: c% = 19
CASE 7: m% = 17: c% = 20
CASE 8: m% = 18: c% = 21
END SELECT
modulator% = m%
carrier% = c%
END SUB

SUB getobjectnxy (pindex%, pframe%)
nx% = o(pindex%).x
ny% = o(pindex%).y
xs% = imx%(imx%(8 + o(pindex%).frame))
ys% = imx%(imx%(8 + o(pindex%).frame) + 1)
nx% = nx% + xs% \ 2
ny% = ny% + ys% \ 2
xs% = imx%(imx%(8 + pframe%))
ys% = imx%(imx%(8 + pframe%) + 1)
nx% = nx% - xs% \ 2
ny% = ny% - ys% \ 2
END SUB

SUB getobjectshipnxy (pframe%)
nx% = shipx%
ny% = shipy%
f% = getshipframe%
xs% = imx%(imx%(8 + f%))
ys% = imx%(imx%(8 + f%) + 1)
nx% = nx% + xs% \ 2
ny% = ny% + ys% \ 2
xs% = imx%(imx%(8 + pframe%))
ys% = imx%(imx%(8 + pframe%) + 1)
nx% = nx% - xs% \ 2
ny% = ny% - ys% \ 2
END SUB

SUB getready
camerayzero
FOR i2% = 1 TO 6
  FOR j% = 0 TO 35
    kbmatrix%(128) = 0
    IF ((i2% AND 1) = 1) THEN SPRITEpn "GET READY", 136, 90
    drawgraphics
    IF MUSICON THEN continueplaysong
    IF SOUNDON THEN continuesfx
  NEXT
NEXT
restorecameray
END SUB

FUNCTION getshipframe%
getshipframe% = 3 + shipsize%
END FUNCTION

SUB hitmark (px%, py%)
new.id = 3
new.x = px%
new.y = py%
new.animmode = 2
new.animfirstframe = 13
new.animlastframe = 14
new.animoriginalcountdown = 1
new.life = 10
addobject
END SUB

SUB hitobject (pindex%, penergy%)
o(pindex%).energy = o(pindex%).energy - penergy%
IF o(pindex%).energy <= 0 THEN
  adddelrequest pindex%
  GOSUB checkobjectaddpowerup
  GOSUB objectaddscore
  SELECT CASE o(pindex%).diemode
    CASE 1
      bigexp pindex%
    CASE 2
      poof pindex%
    CASE 3
      zap pindex%
    CASE 4
      hugenuke pindex%
  END SELECT
  SELECT CASE o(pindex%).id
    CASE 16
      o(pindex%).field1 = o(pindex%).field1 - 1
      IF o(pindex%).field1 > 0 THEN
        poof pindex%
        playsound 4
        copycurrentnew pindex%
        new.floaton = 0
        preservenew% = 1
        new.dy = -1
        GOSUB getasteroidinfog1
        GOSUB addasteroidg1
        new.dy = 1
        GOSUB getasteroidinfog1
        GOSUB addasteroidg1
      ELSE
        bigexp pindex%
      END IF
  END SELECT
END IF
EXIT SUB
 
checkobjectaddpowerup:
f% = 0
SELECT CASE o(pindex%).id
  CASE 2, 13: f% = 1
  CASE 16: f% = 2
  CASE 17: f% = 3
END SELECT
IF f% THEN addpowerup pindex%, f%
RETURN
EXIT SUB

getasteroidinfog1:
f% = 0
SELECT CASE o(pindex%).field1
  CASE 1
    new.energy = ASTEROIDENERGY \ 4
    a% = ASTEROIDSPINDELAY \ 4
    f% = 1
  CASE 2
    new.energy = ASTEROIDENERGY \ 2
    a% = ASTEROIDSPINDELAY \ 2
END SELECT
IF new.dy < 0 THEN
  new.dx = 1
  IF f% THEN new.dx = -2
ELSE
  new.dx = -1
  IF f% THEN new.dx = 2
END IF
RETURN

addasteroidg1:
new.animoriginalcountdown = a%
addobject
RETURN

objectaddscore:
SELECT CASE o(pindex%).id
  CASE 2: s& = 50
  CASE 13: s& = 10
  CASE 18
    s& = 1000
    fadeout% = 1
  CASE 19: s& = 200
  CASE 20: s& = 200
  CASE 21: s& = 200
  CASE 22: s& = 200
  CASE 24: s& = 100
  CASE 25: s& = 100
END SELECT
score& = score& + s&
RETURN

END SUB

SUB hitship (penergy%)
IF shipinvinciblecountdown% = 0 THEN
  playsound 3
  shipenergy% = shipenergy% - penergy%
  IF shipenergy% <= 0 THEN
    shipenergy% = 0
    dieship
  END IF
  statusshakecountdown% = STATUSSHAKEAFTERHITDELAY
  shipinvinciblecountdown% = SHIPINVINCIBLEDELAY
END IF
END SUB

SUB hugenuke (pindex%)
i% = pindex%
f% = 15
getobjectnxy i%, f%
new.id = 26
new.x = nx%
new.y = ny%
new.frame = f%
new.dx = 0: new.dy = -5: preservenew% = 1: addobject: GOSUB nmirroradd
new.dx = 2: new.dy = -4: preservenew% = 1: addobject: GOSUB nmirroradd
new.dx = 3: new.dy = -3: preservenew% = 1: addobject: GOSUB nmirroradd
new.dx = 4: new.dy = -2: preservenew% = 1: addobject: GOSUB nmirroradd
new.dx = 5: new.dy = 0: preservenew% = 1: addobject: GOSUB nmirroradd
clearnew
bossonscreen% = 0
EXIT SUB

nmirroradd:
new.dy = -new.dy: preservenew% = 1: addobject
new.dx = -new.dx: preservenew% = 1: addobject
new.dy = -new.dy: preservenew% = 1: addobject
RETURN



END SUB

SUB idDOC
'id  description           type
'0 = ship sprite         - imaginary
'1 = xtron               - action
'2 = enemy ship 1        - action
'3 = hit mark            - background
'4 = big explosion       - background
'5 = energy powerup      - action
'6 = missile powerup     - action
'7 = star burst          - action
'8 = missile             - action
'9 = smoke puff          - background
'10 = damage explosion   - action
'11 = bullet 1           - action
'12 = poof               - background
'13 = enemy 2            - action
'14 = zap explosion      - background
'15 = check point        - background
'16 = big asteroid       - action
'17 = metal cube         - action
'18 = boss body          - action
'19 = boss top cannon    - action
'20 = boss armor plate   - action
'21 = boss bottom piece  - action
'22 = boss bottom cannon - action
'23 = boss laser         - action
'24 = boss bottom gun    - action
'25 = boss top gun       - action
'26 = explosion spawner  - background
END SUB

SUB imxframes
'imgfile$(0) = "star1.img"
'imgfile$(1) = "star2.img"
'imgfile$(2) = "star3.img"
'imgfile$(3) = "ship.img"
'imgfile$(4) = "ship2.img"
'imgfile$(5) = "ship3.img"
'imgfile$(6) = "ship4.img"
'imgfile$(7) = "planet.img"
'imgfile$(8) = "missile.img"
'imgfile$(9) = "vortex.img"
'imgfile$(10) = "xtron.img"
'imgfile$(11) = "xtron2.img"
'imgfile$(12) = "enemy1.img"
'imgfile$(13) = "hite1.img"
'imgfile$(14) = "hite2.img"
'imgfile$(15) = "exp0.img"
'imgfile$(16) = "exp1.img"
'imgfile$(17) = "exp2.img"
'imgfile$(18) = "exp3.img"
'imgfile$(19) = "exp4.img"
'imgfile$(20) = "exp5.img"
'imgfile$(21) = "exp6.img"
'imgfile$(22) = "exp7.img"
'imgfile$(23) = "exp8.img"
'imgfile$(24) = "exp9.img"
'imgfile$(25) = "exp10.img"
'imgfile$(26) = "exp11.img"
'imgfile$(27) = "exp12.img"
'imgfile$(28) = "exp13.img"
'imgfile$(29) = "exp14.img"
'imgfile$(30) = "exp15.img"
'imgfile$(31) = "exp16.img"
'imgfile$(32) = "exp17.img"
'imgfile$(33) = "exp18.img"
'imgfile$(34) = "exp19.img"
'imgfile$(35) = "statpwr.img"
'imgfile$(36) = "statnrg.img"
'imgfile$(37) = "svline.img"
'imgfile$(38) = "epowerup.img"
'imgfile$(39) = "mpowerup.img"
'imgfile$(40) = "a.img"
'imgfile$(41) = "b.img"
'imgfile$(42) = "c.img"
'imgfile$(43) = "d.img"
'imgfile$(44) = "e.img"
'imgfile$(45) = "f.img"
'imgfile$(46) = "g.img"
'imgfile$(47) = "h.img"
'imgfile$(48) = "i.img"
'imgfile$(49) = "j.img"
'imgfile$(50) = "k.img"
'imgfile$(51) = "l.img"
'imgfile$(52) = "m.img"
'imgfile$(53) = "n.img"
'imgfile$(54) = "o.img"
'imgfile$(55) = "p.img"
'imgfile$(56) = "q.img"
'imgfile$(57) = "r.img"
'imgfile$(58) = "s.img"
'imgfile$(59) = "t.img"
'imgfile$(60) = "u.img"
'imgfile$(61) = "v.img"
'imgfile$(62) = "w.img"
'imgfile$(63) = "x.img"
'imgfile$(64) = "y.img"
'imgfile$(65) = "z.img"
'imgfile$(66) = "0.img"
'imgfile$(67) = "1.img"
'imgfile$(68) = "2.img"
'imgfile$(69) = "3.img"
'imgfile$(70) = "4.img"
'imgfile$(71) = "5.img"
'imgfile$(72) = "6.img"
'imgfile$(73) = "7.img"
'imgfile$(74) = "8.img"
'imgfile$(75) = "9.img"
'imgfile$(76) = "slash.img"
'imgfile$(77) = "infinity.img"
'imgfile$(78) = "starshot.img"
'imgfile$(79) = "mtrail0.img"
'imgfile$(80) = "mtrail1.img"
'imgfile$(81) = "mtrail2.img"
'imgfile$(82) = "mtrail3.img"
'imgfile$(83) = "mtrail4.img"
'imgfile$(84) = "mtrail5.img"
'imgfile$(85) = "mtrail6.img"
'imgfile$(86) = "mtrail7.img"
'imgfile$(87) = "mtrail8.img"
'imgfile$(88) = "mtrail9.img"
'imgfile$(89) = "eshot0.img"
'imgfile$(90) = "eshot1.img"
'imgfile$(91) = "eshot2.img"
'imgfile$(92) = "eshot3.img"
'imgfile$(93) = "enemy2.img"
'imgfile$(94) = "enemy2a.img"
'imgfile$(95) = "zap0.img"
'imgfile$(96) = "zap1.img"
'imgfile$(97) = "zap2.img"
'imgfile$(98) = "s_speed.img"
'imgfile$(99) = "s_misl.img"
'imgfile$(100) = "s_double.img"
'imgfile$(101) = "s_laser.img"
'imgfile$(102) = "s_option.img"
'imgfile$(103) = "s_shield.img"
'imgfile$(104) = "s_mcrush.img"
'imgfile$(105) = "chkpoint.img"
'imgfile$(106) = "asmall1.img"
'imgfile$(107) = "asmall2.img"
'imgfile$(108) = "asmall3.img"
'imgfile$(109) = "asmall4.img"
'imgfile$(110) = "amid1.img"
'imgfile$(111) = "amid2.img"
'imgfile$(112) = "amid3.img"
'imgfile$(113) = "amid4.img"
'imgfile$(114) = "abig1.img"
'imgfile$(115) = "abig2.img"
'imgfile$(116) = "abig3.img"
'imgfile$(117) = "abig4.img"
'imgfile$(118) = "cube0.img"
'imgfile$(119) = "cube1.img"
'imgfile$(120) = "cube2.img"
'imgfile$(121) = "cube3.img"
'imgfile$(122) = "cube4.img"
'imgfile$(123) = "cube5.img"
'imgfile$(124) = "cube6.img"
'imgfile$(125) = "cube7.img"
'imgfile$(126) = "cube8.img"
'imgfile$(127) = "cube9.img"
'imgfile$(128) = "cube10.img"
'imgfile$(129) = "cube11.img"
'imgfile$(130) = "bossbody.img"
'imgfile$(131) = "topcanon.img"
'imgfile$(132) = "botcanon.img"
'imgfile$(133) = "bossgunt.img"
'imgfile$(134) = "bossgunb.img"
'imgfile$(135) = "bosplate.img"
'imgfile$(136) = "bossbotm.img"
'imgfile$(137) = "boslaser.img"
'imgfile$(138) = "skull.img"
'imgfile$(139) = "shiplife.img"
'imgfile$(140) = "blank.img"
END SUB

SUB initcamvariables
floatcameray = 0
cameray% = 0
END SUB

SUB initcolvariables
highestcollisions% = 0
END SUB

SUB initgamevariables
gameenddelay% = 0
gameendflag% = 0
lives% = 5
score& = 0
END SUB

SUB initlevelmusic
playbufferpointer% = 0
playbuffer$(0) = songfile1$
playbuffer$(1) = ""
END SUB

SUB initlevelvariables
levelparsecountdown& = 0
levelindex% = 0
appeardelaycount% = 0
END SUB

SUB initmiscvariables
SELECT CASE difficulty%
  CASE 0: bulletvelocity = 3
  CASE 1: bulletvelocity = 4
  CASE 2: bulletvelocity = 5
  CASE 3: bulletvelocity = 6
END SELECT
bossonscreen% = 0
checkpointlevelindex% = 0
END SUB

SUB initmusicboss
playbufferpointer% = 0
playbuffer$(0) = songfile3$
playbuffer$(1) = ""
END SUB

SUB initplaybuffer
playbufferpointer% = 0
END SUB

SUB initship
shipmode% = 0
shipspeed% = 2
shipenergy% = 3
xtronpower% = 10
shipspeedup% = 0
totalsweapons% = 0
currentsweapon% = 0
shipxtronfiredelay% = 4
statusshakecountdown% = 0
shipinvinciblecountdown% = 0
oldspecialweaponbuttonstatus% = 0
f% = 3 + shipsize%
shipx% = (VIDEOXSIZE \ 2) - imx%(imx%(8 + f%)) \ 2
shipy% = ((VIDEOYSIZE \ 2) - imx%(imx%(8 + f%) + 1) \ 2)
END SUB

SUB initstars
FOR i% = 0 TO MAXSTARS - 1
  star(i%).x = INT(RND * VIDEOXSIZE) - 10
  star(i%).y = INT(RND * 256)
  frame% = INT(RND * 4)
  SELECT CASE frame%
    CASE 0: f% = 0
    CASE 1: f% = 0
    CASE 2: f% = 1
    CASE 3: f% = 2
  END SELECT
  star(i%).frame = f%
  star(i%).dx = -INT(RND * 3) - 1
  star(i%).parallax = -star(i%).dx
NEXT
END SUB

SUB initvariables
initship
initstars
initplaybuffer
initcolvariables
initmiscvariables
initcamvariables
initgamevariables
initlevelmusic
END SUB

SUB levelend
levelparsecountdown& = 32000
END SUB

SUB levelidDOC
'level id (not o id)
'0      Enemy 1       (armored wavy flight path dude)
'1      Enemy 2       (insect that tries to bite you)
'2      Check Point   (when you die you go from here)
'3      Asteroid
'4      Metal cube
'5      Change music to boss music
'6      Energy powerup
'7      Missile powerup
'8      Boss
END SUB

SUB limitcameray
IF cameray% < -SPACEYLIMIT THEN cameray% = -SPACEYLIMIT
IF cameray% > SPACEYLIMIT THEN cameray% = SPACEYLIMIT
END SUB

SUB limitshipbounds
IF shipx% < 2 THEN shipx% = 2
IF shipy% < -SPACEYLIMIT THEN shipy% = -SPACEYLIMIT
f% = 3 + shipsize%
xs% = imx%(imx%(8 + f%))
ys% = imx%(imx%(8 + f%) + 1)
IF (shipx% + xs%) > VIDEOXSIZE THEN shipx% = VIDEOXSIZE - xs%
IF (shipy% + ys%) > (200 + SPACEYLIMIT) THEN shipy% = (200 + SPACEYLIMIT) - ys%
END SUB

SUB limitshipenergy
IF shipenergy% > 16 THEN
  shipenergy% = 16
  starburst
END IF
END SUB

SUB loadassembly
DEF SEG = VARSEG(engine%(0))
BLOAD asmfile1$, VARPTR(engine%(0))
DEF SEG = VARSEG(kbcontrol%(0))
BLOAD asmfile2$, 0
POKE 256, VARSEG(kbmatrix%(0)) AND 255
POKE 257, (VARSEG(kbmatrix%(0)) AND &HFF00) \ 256
POKE 258, VARPTR(kbmatrix%(0)) AND 255
POKE 259, (VARPTR(kbmatrix%(0)) AND &HFF00) \ 256
DEF SEG = VARSEG(collidertn%(0))
BLOAD asmfile3$, VARPTR(collidertn%(0))
DEF SEG = VARSEG(boxrtn%(0))
BLOAD asmfile4$, VARPTR(boxrtn%(0))
DEF SEG = VARSEG(blitbuf2%(0))
BLOAD asmfile5$, 0
DEF SEG
END SUB

SUB loadimx
DEF SEG = VARSEG(imx%(0))
BLOAD imxfile$, VARPTR(imx%(0))
DEF SEG
END SUB

SUB loadlevel
OPEN levelfile$ FOR INPUT AS #1
t% = 0
d% = 0
DO WHILE (EOF(1) = 0) AND (t% < MAXLEVELELEMENTS)
  LINE INPUT #1, a$
  IF a$ <> "" THEN
    a$ = MID$(a$, 2, LEN(a$) - 1)
    FOR x% = 1 TO LEN(a$)
      char$ = MID$(a$, x%, 1)
      id% = -1
      SELECT CASE char$
        CASE "0": id% = 0
        CASE "1": id% = 1
        CASE "2": id% = 2
        CASE "3": id% = 3
        CASE "4": id% = 4
        CASE "5": id% = 5
        CASE "6": id% = 6
        CASE "7": id% = 7
        CASE "8": id% = 8
      END SELECT
      IF (id% >= 0) AND (t% < MAXLEVELELEMENTS) THEN
        levelobject(t%).appeardelay = d%
        levelobject(t%).y = x% * 8
        levelobject(t%).id = id%
        t% = t% + 1
        d% = 0
      END IF
    NEXT
  END IF
  d% = d% + 1
LOOP
CLOSE #1
totallevelobjects% = t%
initlevelvariables
'test code
'levelindex% = 239
'end -> test code
END SUB

SUB loadsoundeffects
DEF SEG = VARSEG(sfx%(0))
BLOAD soundfilename$, VARPTR(sfx%(0))
DEF SEG
END SUB

FUNCTION num$ (pint%)
num$ = MID$(STR$(pint%), 2, LEN(STR$(pint%)) - 1)
END FUNCTION

SUB offkb
IF keyboardon% = 0 THEN EXIT SUB
keyboardon% = 0
DEF SEG = VARSEG(kbcontrol%(0))
CALL ABSOLUTE(&H1B0)
DEF SEG
END SUB

SUB onkb
IF keyboardon% = 1 THEN EXIT SUB
keyboardon% = 1
DEF SEG = VARSEG(kbcontrol%(0))
CALL ABSOLUTE(&H180)
DEF SEG
END SUB

FUNCTION pickchannel% (pn%)
c% = 8
SELECT CASE pn%
  CASE 2: c% = 7
END SELECT
pickchannel% = c%
END FUNCTION

SUB playgame

'Initialize
loadassembly
loadlevel
loadimx
clearsprites
initvariables
getready

onkb
IF (SOUNDON = 1) OR (MUSICON = 1) THEN resetfmcard
IF MUSICON THEN playsong playbuffer$(playbufferpointer%)

DO WHILE gameendflag% = 0
  kbmatrix%(128) = 0
  doexitconditions
  cleardelrequests
  clearaddrequests
  IF shipmode% = 0 THEN controlship
  cameratrackship
  dolevel
  doobjects
  dostars
  addactionsprites
  docollisions
  processcollisions
  processdelrequests
  processaddrequests
  addbgsprites
  addstatussprites
  drawgraphics
  dofadeout
  IF MUSICON THEN continueplaysong
  IF SOUNDON THEN continuesfx
LOOP
message$ = "Bye!!!"

END SUB

SUB playhitsound (pindex%)
s% = 3
SELECT CASE o(pindex%).id
  CASE 16: s% = 7
  CASE 13: s% = -1
END SELECT
IF s% >= 0 THEN playsound s%
END SUB

SUB playnextsong
i% = playbufferpointer% + 1
IF playbuffer$(i%) = "" THEN i% = 0
playbufferpointer% = i%
playsong playbuffer$(i%)
END SUB

SUB playsong (pfilename$)
currentsong$ = pfilename$
FOR n% = 0 TO TOTALVOICES - 1: voice(n%).inuse = 0: voice(n%).delay = 0: NEXT
FOR i% = 0 TO 127: kbmatrix2%(i%) = 0: NEXT
FMPplaystart (pfilename$)
END SUB

SUB playsound (psoundeffectnumber%)
IF SOUNDON = 0 THEN EXIT SUB
pchannel% = pickchannel%(psoundeffectnumber%)
IF pchannel% = 7 THEN
  p% = sfx%(sfx%(8 + psoundeffectnumber% - 1) + 1)
  IF (p% >= sfxpriority%(pchannel%)) THEN
    channelshutoff pchannel%
    playsoundL2 pchannel%, psoundeffectnumber%
  END IF
ELSE
  channelshutoff pchannel%
  playsoundL2 pchannel%, psoundeffectnumber%
END IF
END SUB

SUB playsoundL2 (pchannel%, psoundeffectnumber%)
IF psoundeffectnumber% = 0 THEN EXIT SUB
sfxduration&(pchannel%) = 0
sfxeventcountdown%(pchannel%) = sfx%(sfx%(8 + psoundeffectnumber% - 1))
sfxpriority%(pchannel%) = sfx%(sfx%(8 + psoundeffectnumber% - 1) + 1)
sfxnumber%(pchannel%) = psoundeffectnumber%
i& = sfx%(8 + psoundeffectnumber% - 1)
i& = i& * 2
i& = i& + 4
sfxpointer&(pchannel%) = i&
setchannel pchannel%
END SUB

SUB poof (pindex%)
getobjectnxy pindex%, 79
setnewfloatobject pindex%
poofxy nx%, ny%
END SUB

SUB poofxy (px%, py%)
new.id = 4
new.animoriginalcountdown = 1
new.animfirstframe = 79
new.animlastframe = 88
new.animmode = 3
new.animoriginalcountdown = 2
new.x = px%
new.y = py%
addobject
END SUB

SUB processaddrequests
FOR i% = 0 TO totaladdrequests% - 1
  reallyaddobject i%
NEXT
END SUB

SUB processcollisions
coli% = totalcollisions%
IF coli% > highestcollisions% THEN highestcollisions% = coli%
DO WHILE coli% > 0
  coli% = coli% - 1
  i0% = collisionarray%(0, coli%)
  i1% = collisionarray%(1, coli%)
 
  IF (i0% <> -1) THEN
    id0% = o(i0%).id
  ELSE
    id0% = 0
  END IF
 
  IF (i1% <> -1) THEN
    id1% = o(i1%).id
  ELSE
    id1% = 0
  END IF
 
  IF id0% > id1% THEN
    SWAP i0%, i1%
    SWAP id0%, id1%
  END IF
 
  SELECT CASE id0%          'Process collision cases
    CASE 0                  'Player's ship collided with...
      SELECT CASE id1%
        CASE 2, 13            'Enemy 1 or Enemy 2
          GOSUB collideplayerenemy
        CASE 5                'Energy powerup
          playsound 5
          adddelrequest i1%
          shipenergy% = shipenergy% + 1
          limitshipenergy
        CASE 6                'Missile powerup
          playsound 5
          adddelrequest i1%
          ti% = findsweapon%("missile")
          IF ti% = -1 THEN
            addsweapon "missile", 2, 0, 0, -1
            currentsweapon% = totalsweapons% - 1
          ELSE
            IF sweapon(ti%).ammo = -1 THEN
              t% = sweapon(ti%).power
              IF (t% > 0) THEN
                t% = t% + 1
                n% = sweapon(ti%).maxpower
                IF t% > n% THEN
                  t% = n%
                  starburst
                END IF
              END IF
              sweapon(ti%).power = t%
            ELSE
              sweapon(ti%).ammo = sweapon(ti%).ammo + 2
            END IF
          END IF
        CASE 11               'bullet 1
          adddelrequest i1%
          hitmark o(i1%).x, o(i1%).y
          hitship 1
        CASE 16, 17, 23, 18, 19, 20, 21, 22, 24, 25
          IF shipinvinciblecountdown% = 0 THEN
            IF id1% = 16 THEN
              hitship o(i1%).field1
              bigexpship
            ELSEIF (id1% = 17) OR (id1% = 23) OR (id1% = 18) THEN
              hitship 2
              bigexpship
            ELSE
              hitmark o(i1%).x, o(i1%).y
              hitship 1
            END IF
            hitmark o(i1%).x, o(i1%).y
          END IF
      END SELECT
    CASE 1                  'Xtron collided with...
      SELECT CASE id1%
        CASE 2, 13, 16, 17, 18, 19, 20, 21, 22, 24, 25
          IF finddelrequest%(i1%) = 0 THEN
            adddelrequest i0%
            hitmark o(i0%).x, o(i0%).y - 4
            playhitsound i1%
            hitobject i1%, xtronpower%
          END IF
          s& = 0
          SELECT CASE id1%
            CASE 16: s& = 1
            CASE 17: s& = 2
          END SELECT
          score& = score& + s&
      END SELECT
    CASE 2                     'Enemy 1 collided with...
      SELECT CASE id1%
        CASE 7                  'Star burst
          hitmark o(i1%).x, o(i1%).y - 4
          hitobject i0%, STARBURSTPOWER
          playsound 3
        CASE 8                  'Player's missile
          adddelrequest i1%
          bigdamageexp i1%
        CASE 10                 'Damage explosion
          IF finddelrequest%(i0%) = 0 THEN
            hitobject i0%, DAMAGEEXPPOWER
            IF o(i0%).energy <= 0 THEN spawnbigdamageexp i0%
          END IF
      END SELECT
    CASE 7                    'Star burst collided with...
      SELECT CASE id1%
        CASE 13, 16, 17, 18, 19, 20, 21, 22, 24, 25
          IF finddelrequest%(i1%) = 0 THEN
            hitmark o(i0%).x, o(i0%).y - 4
            hitobject i1%, STARBURSTPOWER
            playsound 3
          END IF
      END SELECT
    CASE 8                     'Player's missile collided with...
      SELECT CASE id1%
        CASE 13, 16, 17, 18, 19, 20, 21, 22, 24, 25
          adddelrequest i0%
          bigdamageexp i0%
      END SELECT
    CASE 10                    'Damage explosion collided with...
      SELECT CASE id1%
        CASE 13, 16, 17, 18, 19, 20, 21, 22, 24, 25
          IF finddelrequest%(i1%) = 0 THEN
            hitobject i1%, DAMAGEEXPPOWER
            IF o(i1%).energy <= 0 THEN
              spawnbigdamageexp i1%
              score& = score& + 10
            END IF
          END IF
      END SELECT
  END SELECT
LOOP
EXIT SUB
        
collideplayerenemy:
hitobject i1%, KILLHITPOWER
hitmark o(i1%).x, o(i1%).y
hitship 2
RETURN

END SUB

SUB processdelrequests
t% = totaldelrequests%

IF t% = 0 THEN EXIT SUB

'Sort o delete requests in ascending order
FOR i1% = 0 TO t% - 2
  FOR i2% = i1% + 1 TO t% - 1
    IF delrequest%(i1%) > delrequest%(i2%) THEN SWAP delrequest%(i1%), delrequest%(i2%)
  NEXT
NEXT

'Delete objects according to delete requests
FOR i% = 0 TO t% - 1
  n% = delrequest%(i%)
  delobject n%
  IF totalobjects% > 0 THEN
    FOR i1% = i% + 1 TO t% - 1
      IF delrequest%(i1%) = totalobjects% THEN delrequest%(i1%) = n%
    NEXT
  END IF
NEXT
checkstopmislsound
checkstartmslsound
END SUB

SUB reallyaddobject (pindex%)
i% = totalobjects%
IF i% >= MAXOBJECTS THEN EXIT SUB
i2% = pindex%
o(i%).id = addrequest(i2%).id
o(i%).x = addrequest(i2%).x
o(i%).y = addrequest(i2%).y
o(i%).frame = addrequest(i2%).frame
o(i%).dx = addrequest(i2%).dx
o(i%).dy = addrequest(i2%).dy
o(i%).cliptype = addrequest(i2%).cliptype
o(i%).animmode = addrequest(i2%).animmode
o(i%).animfirstframe = addrequest(i2%).animfirstframe
o(i%).animlastframe = addrequest(i2%).animlastframe
o(i%).animcountdown = addrequest(i2%).animcountdown
o(i%).animoriginalcountdown = addrequest(i2%).animoriginalcountdown
o(i%).animdelta = addrequest(i2%).animdelta
o(i%).life = addrequest(i2%).life
o(i%).energy = addrequest(i2%).energy
o(i%).diemode = addrequest(i2%).diemode
o(i%).floaton = addrequest(i2%).floaton
o(i%).floatx = addrequest(i2%).x
o(i%).floaty = addrequest(i2%).y
o(i%).floatdx = addrequest(i2%).floatdx
o(i%).floatdy = addrequest(i2%).floatdy
o(i%).floatddx = addrequest(i2%).floatddx
o(i%).floatddy = addrequest(i2%).floatddy
o(i%).field1 = addrequest(i2%).field1
o(i%).field2 = addrequest(i2%).field2
o(i%).field3 = addrequest(i2%).field3
o(i%).field4 = addrequest(i2%).field4
o(i%).field5 = addrequest(i2%).field5
o(i%).field6 = addrequest(i2%).field6
o(i%).field7 = addrequest(i2%).field7
o(i%).field8 = addrequest(i2%).field8
o(i%).field9 = addrequest(i2%).field9
o(i%).field10 = addrequest(i2%).field10
totalobjects% = i% + 1
END SUB

SUB resetfmcard
FOR n% = 0 TO 244: adlport n%, 0: NEXT
adlport 1, 32
END SUB

SUB restorecameray
cameray% = oldcameray%
END SUB

SUB setchannel (pchannel%)
i& = sfxpointer&(pchannel%)
sfxdelaycountdown%(pchannel%) = sfx%(i& \ 2)
getchan pchannel%
m% = modulator%
c% = carrier%
s& = VARSEG(sfx%(0))
DEF SEG = s&: adlport &H20 + m%, PEEK(i& + 2)
DEF SEG = s&: adlport &H20 + c%, PEEK(i& + 3)
DEF SEG = s&: adlport &H40 + m%, PEEK(i& + 4)
DEF SEG = s&: adlport &H40 + c%, PEEK(i& + 5)
DEF SEG = s&: adlport &H60 + m%, PEEK(i& + 6)
DEF SEG = s&: adlport &H60 + c%, PEEK(i& + 7)
DEF SEG = s&: adlport &H80 + m%, PEEK(i& + 8)
DEF SEG = s&: adlport &H80 + c%, PEEK(i& + 9)
DEF SEG = s&: adlport &HE0 + m%, PEEK(i& + 10)
DEF SEG = s&: adlport &HE0 + c%, PEEK(i& + 11)
DEF SEG = s&: adlport &HC0 + pchannel%, PEEK(i& + 12)
DEF SEG = s&: adlport &HA0 + pchannel%, PEEK(i& + 14)
DEF SEG = s&: adlport &HB0 + pchannel%, PEEK(i& + 15) OR 32
DEF SEG = s&: sfxoldregister%(pchannel%) = PEEK(i& + 15)
DEF SEG
END SUB

SUB setdefaultcontrols
upkey% = 72                       'UP ARROW
rightkey% = 77                    'RIGHT ARROW
downkey% = 80                     'DOWN ARROW
leftkey% = 75                     'LEFT ARROW
firenormalweaponbutton% = 29      'CTRL
specialweaponbutton% = 56         'ALT
END SUB

SUB setnewfloatobject (pindex%)
IF o(pindex%).floaton THEN
  new.floaton = 1
  new.floatdx = o(pindex%).floatdx
  new.floatdy = o(pindex%).floatdy
  new.floatx = nx%
  new.floaty = ny%
END IF
END SUB

SUB showkeys
LOCATE 3, 1
centreprint "  Mono space contols:"
PRINT
centreprint "  arrows = move around"
centreprint "  ctrl = shoot normal weapon"
centreprint "  alt = shoot special weapon"
PRINT
centreprint "  Press any key to play Mono Space"
waitkey
END SUB

SUB soundDOC
'sound effect number
'1 kill zap explosion
'2 xtron shot
'3 hit enemy armor
'4 explosion 1
'5 pickup energy powerup
'6 launch missile
'7 hit asteroid
END SUB

SUB spawnbigdamageexp (pindex%)
playsound 4
getobjectnxy pindex%, 15
f% = 1
SELECT CASE o(pindex%).id
  CASE 16: f% = 0
END SELECT
IF f% THEN
  bigdexpxy nx%, ny%
ELSE
  bigdamageexpxy nx%, ny%
END IF
END SUB

SUB SPRITEaddaobjects
FOR n% = 0 TO totalobjects% - 1
  f% = 0
  SELECT CASE o(n%).id
    CASE 1, 2, 5, 6, 7, 8, 10, 11, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25: f% = 1
  END SELECT
  IF f% THEN addsprite o(n%).x, o(n%).y, o(n%).frame, n%
NEXT
END SUB

SUB SPRITEaddbobjects
FOR n% = 0 TO totalobjects% - 1
  FOR n% = 0 TO totalobjects% - 1
    f% = 0
    SELECT CASE o(n%).id
      CASE 3, 4, 9, 12, 14, 15, 26: f% = 1
    END SELECT
    IF f% THEN addsprite o(n%).x, o(n%).y, o(n%).frame, n%
  NEXT
NEXT
END SUB

SUB SPRITEaddship
IF (shipmode% = 0) AND ((shipinvinciblecountdown% AND 1) = 0) THEN
  f% = getshipframe%
  addsprite shipx%, shipy%, f%, -1
END IF
END SUB

SUB SPRITEaddstars
camerayzero
FOR i% = 0 TO MAXSTARS - 1
  y% = (star(i%).y - (oldcameray% * (star(i%).parallax / 8)))
  y% = (y% AND &HFF) - 10
  addsprite star(i%).x, y%, star(i%).frame, 0
NEXT
restorecameray
END SUB

SUB SPRITEpn (ppstring$, px%, py%)
pstring$ = UCASE$(ppstring$)
x% = px%
FOR i% = 1 TO LEN(pstring$)
  code% = ASC(MID$(pstring$, i%, 1))
  f% = -1
  IF (code% >= 48) AND (code% <= 57) THEN f% = code% + 18
  IF (code% = 47) THEN f% = 76
  IF (code% >= 65) AND (code% <= 90) THEN f% = code% - 25
  IF f% > -1 THEN addsprite x%, py%, f%, 0
  x% = x% + 6
NEXT
END SUB

SUB starburst
f% = 78
getobjectshipnxy f%
new.id = 7
new.x = nx%
new.y = ny%
new.frame = f%
new.dx = 0: new.dy = -5: preservenew% = 1: addobject: GOSUB mirroradd
new.dx = 2: new.dy = -4: preservenew% = 1: addobject: GOSUB mirroradd
new.dx = 3: new.dy = -3: preservenew% = 1: addobject: GOSUB mirroradd
new.dx = 4: new.dy = -2: preservenew% = 1: addobject: GOSUB mirroradd
new.dx = 5: new.dy = 0: preservenew% = 1: addobject: GOSUB mirroradd
clearnew
EXIT SUB

mirroradd:
new.dy = -new.dy: preservenew% = 1: addobject
new.dx = -new.dx: preservenew% = 1: addobject
new.dy = -new.dy: preservenew% = 1: addobject
RETURN

END SUB

SUB stopplaysong
playmode% = 0
resetfmcard
END SUB

SUB vsync
DEF SEG = &H40
l& = PEEK(&H63)
h& = PEEK(&H64)
p& = h&
p& = p& * 256
p& = p& + l&
WAIT p& + 6, 8
WAIT p& + 6, 8, 8
DEF SEG
END SUB

SUB waitkey
DO: a$ = INKEY$: LOOP WHILE a$ = ""
IF a$ = CHR$(27) THEN exitgame
END SUB

SUB wingame
offkb
credits
message$ = "Congratulations, you have saved the GALAXY!"
exitgame
END SUB

SUB zap (pindex%)
getobjectnxy pindex%, 95
setnewfloatobject pindex%
zapxy nx%, ny%
playsound 1
END SUB

SUB zapxy (px%, py%)
new.id = 14
new.animoriginalcountdown = 1
new.animfirstframe = 95
new.animlastframe = 97
new.animmode = 2
new.animoriginalcountdown = 2
new.life = 15
new.x = px%
new.y = py%
addobject
END SUB

