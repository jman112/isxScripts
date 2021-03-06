variable(script) int Slow = 20

#include core/Defines.iss
#include core/Macros.iss
#include core/theShip.iss
#include core/theAgent.iss
#include core/theChicken.iss

#include debug/theDebug.iss

#include moods/Salvager.iss
#include moods/Miner.iss
#include moods/Missioner.iss

variable(script) theShip Ship
variable(script) theAgent Mission
variable(script) theChicken Chicken
variable(script) theDebug Debug

variable(script) Salvager Salvager
variable(script) Missioner Missioner
variable(script) Miner Miner

variable(script) bool Paused = TRUE
variable(script) string State = Salvager

variable(script) int MessageCount = 1
variable(script) bool ShowDebug = FALSE
variable(script) bool EntityWatch = FALSE

variable(script) string BookmarkSymbol = "@"
variable(script) string HomeBookmarkSymbol = "?"

variable(script) settingsetref AgentConfig
variable(script) int64 CurrentAgent

variable(script) bool Looting = TRUE
variable(script) bool GoSafe = TRUE
variable(script) bool StayOn = FALSE
variable(script) bool Looped = FALSE
variable(script) bool RemoveBookmarks = FALSE
variable(script) int CargoFullPct = 90

variable(script) bool ChickenOnTank = FALSE
variable(script) bool ChickenOnRat = FALSE
variable(script) bool ChickenOnPirate = FALSE
variable(script) bool ChickenOnTargeted = FALSE

function main()
{
	echo Start
	
	UI -load UI/BotUI
	while 1
	{
		while ${Paused}
		{
			wait 5
		}
		switch ${State}
		{
			case Salvager
				call Salvager.Begin
				break
			case GoHome
				if !INSPACE
					call Ship.Undock
				call Ship.Goto ${HomeBookmarkSymbol}
				break
			case Goto
				if !INSPACE
					call Ship.Undock
				call Ship.Goto ${BookmarkSymbol}
				break
			case Miner
				call Miner.Begin
				break
			case Missioner
				call Missioner.Begin
				break
		}
		if ${Looped}
			State:Set[Salvager]
		else
		{
			State:Set[Null]
			Paused:Set[TRUE]
		}
	}
}

function atexit()
{

	UI -unload UI/BotUI
	
	echo done
}