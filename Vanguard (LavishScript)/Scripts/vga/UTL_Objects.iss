objectdef ClassRole
{
	member:bool healer()
		{
		if (${MyClass.Equal[Blood Mage]} || ${MyClass.Equal[Cleric]} || ${MyClass.Equal[Disciple]} || ${MyClass.Equal[Shaman]} || ${MyClass.Equal[Paladin]})
		return TRUE
		}
	member:bool tank()
		{
		If (${MyClass.Equal[Warrior]} || ${MyClass.Equal[Paladin]} || ${MyClass.Equal[Dread Knight]})
		return TRUE
		}
	member:bool melee()
		{
		If (${MyClass.Equal[Ranger]} || ${MyClass.Equal[Rogue]} || ${MyClass.Equal[Monk]} || ${MyClass.Equal[Bard]})
		return TRUE
		}
	member:bool caster()
		{
		If (${MyClass.Equal[Sorcerer]} || ${MyClass.Equal[Necromancer]} || ${MyClass.Equal[Psionicist]} || ${MyClass.Equal[Druid]})
		return TRUE
		}
	member:bool crowdcontroler()
		{
		If (${MyClass.Equal[Sorcerer]} || ${MyClass.Equal[Necromancer]} || ${MyClass.Equal[Psionicist]} || ${MyClass.Equal[Bard]})
		return TRUE
		}
	member:bool feigndeather()
		{
		If (${MyClass.Equal[Monk]} || ${MyClass.Equal[Necromancer]} || ${MyClass.Equal[Disciple]})
		return TRUE
		}
	member:bool resurrecter()
		{
		if (${MyClass.Equal[Blood Mage]} || ${MyClass.Equal[Cleric]} || ${MyClass.Equal[Disciple]} || ${MyClass.Equal[Shaman]} || ${MyClass.Equal[Paladin]})
		return TRUE
		}
	member:bool disspeller()
		{
		if (${MyClass.Equal[Sorcerer]} || ${MyClass.Equal[Bard]})
		return TRUE
		}
	member:bool stancepusher()
		{
		if (${MyClass.Equal[monk]} || ${MyClass.Equal[disciple]})
		return TRUE
		}
}

variable ClassRole ClassRole

function MeClassCrashWorkAround()
{	
	if ${Me.Class.Equal[Warrior]}
		{
		MyClass:Set["Warrior"]
		UIElement[warriorfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Paladin]}
		{
		MyClass:Set["Paladin"]
		UIElement[paladinfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Dread Knight]}
		{
		MyClass:Set["Dread Knight"]
		UIElement[dreadknightfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Blood Mage]}
		{
		MyClass:Set["Blood Mage"]
		UIElement[bloodmagefrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Cleric]}
		{
		MyClass:Set["Cleric"]
		UIElement[clericfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Disciple]}
		{
		MyClass:Set["Disciple"]
		UIElement[disciplefrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Shaman]}
		{
		MyClass:Set["Shaman"]
		UIElement[shamanfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Ranger]}
		{
		MyClass:Set["Ranger"]
		UIElement[rangerfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Rogue]}
		{
		MyClass:Set["Rogue"]
		UIElement[roguefrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Monk]}
		{
		MyClass:Set["Monk"]
		UIElement[monkfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Bard]}
		{
		MyClass:Set["Bard"]
		UIElement[bardfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Sorcerer]}
		{
		MyClass:Set["Sorcerer"]
		UIElement[sorcererfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Necromancer]}
		{
		MyClass:Set["Necromancer"]
		UIElement[necromancerfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Psionicist]}
		{
		MyClass:Set["Psionicist"]
		UIElement[psionicistfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}
	if ${Me.Class.Equal[Druid]}
		{
		MyClass:Set["Druid"]
		UIElement[druidfrm@ClassFrm@Class@ABot@vga_gui]:Show
		}

}


objectdef GroupStatus
{
	member:bool Alive()
	{
		variable int icnt = 1
		do
		{
		If ${Group[${icnt}].ToPawn.IsDead} 
			{
			return FALSE
			}
		} 
		while ${icnt:Inc} <= ${Group.Count}
		return TRUE
	}
	member:bool AOEBuffClose()
	{
		variable int icnt = 1
		variable int grpcnt = 0
		do
		{
		If ${Group[${icnt}].ToPawn.Distance} < 19
			{
			grpcnt:Inc
			}
		} 
		while ${icnt:Inc} <= ${Group.Count}
		if ${grpcnt} == ${Group.Count}
			return TRUE 
		else
			return FALSe
	}
	
}

variable GroupStatus GroupStatus

objectdef MobResists
{
	member:bool Fire()
	{
		variable iterator Iterator
		Fire:GetSettingIterator[Iterator]
		Iterator:First
		while ( ${Iterator.Key(exists)} )
		{
			if ${Me.Target.Name.Equal[${Iterator.Value}]} 
				return TRUE
		Iterator:Next
		}
	return FALSE
	}

	member:bool Ice()
	{
		variable iterator Iterator
		Ice:GetSettingIterator[Iterator]
		Iterator:First
		while ( ${Iterator.Key(exists)} )
		{
			if ${Me.Target.Name.Equal[${Iterator.Value}]} 
				return TRUE
		Iterator:Next
		}
	return FALSE
	}
	member:bool Spiritual()
	{
		variable iterator Iterator
		Spiritual:GetSettingIterator[Iterator]
		Iterator:First
		while ( ${Iterator.Key(exists)} )
		{
			if ${Me.Target.Name.Equal[${Iterator.Value}]} 
				return TRUE
		Iterator:Next
		}
	return FALSE
	}

	member:bool Physical()
	{
		variable iterator Iterator
		Physical:GetSettingIterator[Iterator]
		Iterator:First
		while ( ${Iterator.Key(exists)} )
		{
			if ${Me.Target.Name.Equal[${Iterator.Value}]} 
				return TRUE
		Iterator:Next
		}
	return FALSE
	}

	member:bool Arcane()
	{
		variable iterator Iterator
		Arcane:GetSettingIterator[Iterator]
		Iterator:First
		while ( ${Iterator.Key(exists)} )
		{
			if ${Me.Target.Name.Equal[${Iterator.Value}]} 
				return TRUE
		Iterator:Next
		}
	return FALSE
	}
	
}

variable MobResists MobResists
