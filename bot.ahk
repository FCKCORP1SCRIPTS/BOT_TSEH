#SingleInstance, Force
#MaxThreadsPerHotkey 3
If Not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
	ExitApp
}
URL_BASE = https://fckcorp.ru/
SetWorkingDir, %A_AppData%\FCKCORP
UrlDownloadToFile, URL, %A_AppData%\FCKCORP2\triggers\
file = src/config.ini
IniRead, first_load, %file%, first_load, first_load
if(first_load != 1) {
IniWrite, 1, %file%, first_load, first_load
MsgBox, 64, Первый запуск, Вы успешно установили бота для NEXTRP [Цеха]`n`nУзнать информацию можно нажав на кнопку INFO`nВам надо выбрать цеха и сохранить информацию.`n`nНаш дискорд с ботами -  https://discord.gg/gUd2dSaKaq
	IniRead, first_load, %file%, first_load, first_load
}
if(first_load = 1) {
IniRead, LVL, %file%, Information, Lvl
IniRead, lvl_clan_choose_cfg, %file%, Information, Lvl_clan, 1


Gui, font, unispace s9 bold
gui, add, picture, w700 h400 x0 y0, src/back.png
gui, add, picture, x22 y340 w150 h40 vClose gPic1, src/buttons/close.png
gui, add, picture, x22 y5 w37 h37 vInfo gPic3, src/buttons/info.png
gui, add, text, x202 y63 h20 w150 0x1, Выберите уровень цеха
gui, add, dropdownlist, x22 y63 w150 vDDL gCheckDDL, Не выбран|1 уровень|2 уровень|3 уровень|4 уровень|5 уровень|6 уровень|7 уровень|8 уровень|9 уровень|10 уровень

Gui, Add, Edit, x22 y89 w150 h30 vlvl_clan_choose 0x1, %lvl_clan_choose%
Gui, Add, Text, x202 y89 w150 h30 0x1, Введите ваш уровень в клане

Gui, Add, DropDownList, x22 y125 w150 h30 vcooldown_red 0x1, 180S|540S
Gui, Add, Text, x202 y125 w150 h20 0x1, Выберите бафф

gui, add, picture, x517 y70 w166 h26 vSite gPic4, src/buttons/button_goto_site.png
gui, add, picture, x517 y126 w166 h26 vDiscrod gPic5, src/buttons/button_goto_discord.png
gui, add, picture, x517 y178 w166 h26 vYouTube gPic6, src/buttons/button_goto_youtube.png
gui, add, picture, x525 y340 w150 h40 vSave gPic2, src/buttons/goto.png
gui, add, picture, x525 y340 w150 h40 vSNA gPic7, src/buttons/goto_uncomfirmed.png


    ;IniRead, LVL, %file%, Information, Lvl
    ;IniRead, lvl_clan_choose, %file%, Information, Lvl_clan, 1
GuiControl, text, lvl_clan_choose, %lvl_clan_choose_cfg%

if(LVL != "1 уровень" or "2 уровень" or "3 уровень" or "4 уровень" or "5 уровень" or "6 уровень" or "7 уровень" or "8 уровень" or "9 уровень" or "10 уровень") {
GuiControl, choose, DDL, Не выбран
}
if(LVL = "1 уровень" or "2 уровень" or "3 уровень" or "4 уровень" or "5 уровень" or "6 уровень" or "7 уровень" or "8 уровень" or "9 уровень" or "10 уровень") {
GuiControl, choose, DDL, %LVL%
}

gui, show, w700 h400, NEXTRP BOT
if(DDL != "Не выбран") {
	if(lvl_clan_choose > 0 or lvl_clan_choose_cfg > 0) {
		GuiControl, hide, SNA
		GuiControl, show, Save
	}
	if(lvl_clan_choose <= 0 && lvl_clan_choose_cfg <= 0) {
		GuiControl, show, SNA
		GuiControl, hide, Save
		while(lvl_clan_choose <= 0) {
		sleep 1500
		Gui, submit
		Gui, show

			if(lvl_clan_choose > 0 or lvl_clan_choose_cfg > 0) {
				GuiControl, hide, SNA
				GuiControl, show, Save
			}
		}
	}
}
return
}

guiclose:
ExitApp

Pic1:
ExitApp
return
Pic2:
Gui, submit
IniWrite, %lvl_clan_choose%, %file%, Information, Lvl_clan

Switch DDL
{
  Case "1 уровень":
	Global count_hash = 5
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 70*(60*1000)
	Global time_other := time_washing-time_fas
  Case "2 уровень":
	Global count_hash = 7
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 70*(60*1000)
	Global time_other := time_washing-time_fas
  Case "3 уровень":
    Global count_hash = 10
	Global time_fas := (count_hash*12)*3*1000
	Global time_washing = 50*(60*1000)
	Global time_other := time_washing-time_fas
  Case "4 уровень":
	Global count_hash = 12
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 50*(60*1000)
	Global time_other := time_washing-time_fas
  Case "5 уровень":
  	Global count_hash = 15
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 50*(60*1000)
	Global time_other := time_washing-time_fas
  Case "6 уровень":
  	Global count_hash = 17
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 27*(60*1000)
	Global time_other := time_washing-time_fas
  Case "7 уровень":
  	Global count_hash = 20
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 27*(60*1000)
	Global time_other := time_washing-time_fas
  Case "8 уровень":
  	Global count_hash = 22
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 27*(60*1000)
	Global time_other := time_washing-time_fas
  Case "9 уровень":
  	Global count_hash = 25
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 27*(60*1000)
	Global time_other := time_washing-time_fas
  Case "10 уровень":
  	Global count_hash = 27
	Global time_fas = (count_hash*12)*3*1000
	Global time_washing = 27*(60*1000)
	Global time_other := time_washing-time_fas
}
	Global time_other := time_other+30000
	Global time_fas := time_fas+5000
return
Pic3:
MsgBox, Работает!
return

Pic4:
run, https://fckcorp.ru
return
Pic5:
run, https://discord.gg/gUd2dSaKaq
return
Pic6:
MsgBox, https://www.youtube.com/channel/UC5p8z9KewpJfIUc6Ukmx6Fg/videos
return
Pic7:
Gui, show
MsgBox, 16, Данные не заполнены, Заполните данные для запуска бота.
return
CheckDDL:
Gui, submit
Gui, show
if(DDL = "Не выбран") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "1 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "2 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "3 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "4 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "5 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "6 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "7 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "8 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "9 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
if(DDL = "10 уровень") {
MsgBox % DDL
IniWrite, %DDL%, %file%, Information, Lvl
}
return
1::
	cd = 100
	global cd := cd
	;MsgBox % time_washing "`n" time_fas "`n" count_hash "`n" tseh
	WinGetActiveTitle, Title
	WinGet, nextrp_pid, PID, %Title%
	global nextrp_pid := nextrp_pid
	CoordMode, Mouse,Screen
	sleep 150
loop 6 {
walkAlt("w")
sleep 2500
take_all()
sleep 250
take()
sleep 250
take_all_hash()
sleep 350
close(2)
sleep 250
}
walkAlt("d")
	loop 6 {
		walkAlt("s")w
		sleep 2500
		take_all()
		sleep 250
		take()
		sleep 250
		take_all_hash()
		sleep 350
		close(2)
		sleep 250
	}
walkAlt("a")
	sleep 250
	close(2)
	sleep 500
	SendInput, {s down}
	sleep 700
	SendInput, {s up}
	sleep 700
	SendInput, {a down}
	sleep 1050
	SendInput, {a up}
	sleep 1050
walkAlt("w")
	sleep 250
	startFas()
	sleep %time_fas%
	close(1)
	sleep %time_other%
	SendInput, {d down}
	sleep 70
	SendInput, {d up}
	sleep 250
	SendInput, {s down}
	sleep 700
	SendInput, {s up}
	sleep 700
	SendInput, {d down}
	sleep 1050
	SendInput, {d up}
	sleep 1050
return
down(list) {
	if(list = "3") {
		x_move2 = 1444
		y_move2 = 455
		y_move_to2 := y_move2+96
		MouseMove, %x_move2%, %y_move2%
		sleep %cd%
		ControlClick,, ahk_pid %nextrp_pid%,,,,D
		sleep  %cd%
		MouseMove, %x_move2%, %y_move_to2%
		sleep %cd%
		ControlClick,, ahk_pid %nextrp_pid%,,,,U
		sleep %cd%
	}

	if(list = "2") {
		x_move = 1344
		y_move = 455
		y_move_to := y_move+96
		MouseMove, %x_move%, %y_move%
		sleep %cd%
		ControlClick,, ahk_pid %nextrp_pid%,,,,D
		sleep  %cd%
		MouseMove, %x_move%, %y_move_to%
		sleep %cd%
		ControlClick,, ahk_pid %nextrp_pid%,,,,U
		sleep %cd%
	}
}
place(A_Loop_Time){
loop %A_Loop_Time% {
	Found = 0
	while(Found = 0) {
		ImageSearch, OutputVarX, OutputVarY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, src/triggers/hash.png
		if(OutputVarX > 0) {
			OutputVarX := OutputVarX+20
			OutputVarY := OutputVarY+50
			MouseMove, %OutputVarX%, %OutputVarY%
			sleep 50
			ControlClick,, ahk_pid %nextrp_pid%,,,,D
			sleep 20
			ControlClick,, ahk_pid %nextrp_pid%,,,,U
			sleep 20
			OutputVarX = 0
			OutputVarY = 0
			Found = 1
		}
	}
	sleep 150
}
}

Check_Stop(){
; Здесь будет проверка на то, закрнчилась ли картоха.(имагесеарч)
}

take_all() {
	MouseMove, 1200, 293
	sleep 50
	click
	sleep 20
	click
	sleep 20
}

take_all_hash() {
		MouseMove, 950, 785
		sleep 100
		click
		sleep 150
	}

walkAlt(kl) {
	run, src\alt.ahk
	SendInput, {%kl% down}
	Sleep 2500
	SendInput, {%kl% up}
}

take() {
Switch count_hash
{
  Case "5":
	place(5)
  Case "7":
	place(7)
  Case "10":
	place(10)
  Case "12":
	place(10)
	down(2)
	place(2)
  Case "15":
	place(10)
	down(2)
	place(5)
  Case "17":
	place(10)
	down(2)
	place(7)
  Case "20":
	place(10)
	down(2)
	place(10)
  Case "22":
	place(10)
	down(2)
	place(10)
	down(3)
	place(2)
  Case "25":
	place(10)
	down(2)
	place(10)
	down(3)
	place(5)
  Case "27":
	place(10)
	down(2)
	place(10)
	down(3)
	place(7)
	}
}

close(vib) {
	if(vib = "1") {
		MouseMove, 1430, 223
		sleep 100
		click
		sleep 150
	}
	if(vib = "2") {
		MouseMove, 1315, 280
		sleep 100
		click
		sleep 150
	}
}

startFas() {
		MouseMove, 680, 820
		sleep 100
		click
		sleep 150
}