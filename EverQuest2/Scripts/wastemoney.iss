; Lets waste some money - Trails
; run wastemoney <amount of silver to waste>


function main(waste)

	{
		declare startmoney int script 0
		declare waste int script 0

			startmoney:Set[${Math.Calc[(${Me.Platinum}*10000)+${Me.Gold}*100+${Me.Silver}]}]
			waste:Set[${Math.Calc[${startmoney}-${waste}]}]
				
				target game
				Actor[${Target}]:DoubleClick
												
				eq2echo Starting with ${startmoney} silver
				eq2echo Will stop at ${waste} silver
				do
					{
					EQ2UIPage[mainhud,lotto].Child[button,Lotto.Ticket.Buy]:LeftClick
					wait 75
					}
				while ${Math.Calc[(${Me.Platinum}*10000)+${Me.Gold}*100+${Me.Silver}]}>=${waste} 

				eq2echo We have wasted enough money.
	}