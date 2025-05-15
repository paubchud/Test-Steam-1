/// @description Adjust player UI
switch (pClass){
	/*
	Class: Warrior
	Group: Primate
	Health   - Medium ; 70
	Resource - Rage ; Regen on Hit ; Max:20
	Gold;    - No regen ; No starting
	
	Swing - Swing sword	; 1 stamina ; 4 dmg ; Low range
	Rage - Empower health ; 20 stamina ; +10% hp, +25% dmg
			and damage 
	*/
	case CLASS.WARRIOR:
		pHealth = 70;
		pResource = 0;
	break;
	/*
	Class: Hunter
	Group: Primate
	Health   - Low ; 20
	Resource - Arrows ; Regen slow ; Max:5
	Gold;    - No regen ; No starting
	
	Shoot - Shoot arrow ; 1 arrow ; 3 dmg ; High range
	Volley - Shoot in cone ; 5 arrows ; 5 dmg per arrow ; High range
	*/
	
	/*
	Class: Gatherer
	Group: Primate
	Health   - Medium ; 40
	Resource - ? ; 0/5
	Gold;    - No regen ; No starting
	
	
	*/
	
	/*
	Class: Samuri
	Group: Primate
	Health   - Medium ; 30
	Resource - Stamina ; Regen slow when not attacking ; Max:25
	Gold;    - No regen ; No starting
	
	Slice - Small cone slash ; 7 stamina ; 3 dmg ; Low range
	Dash - Short dash ; 12 stamina ; 4 dmg ; Mid range
	*/
	
	/*
	Class: Engineer
	Group: Primate
	Health   - 4/5
	Resource - Gears ; Salvage tower from condition ; Max:3
	Gold;    - 2/5
	
	Turret - Place small turret ; 1 gear ; 2 dmg ; Mid range
	Scaffolding - Create platform ; -1 max gear ; 0 dmg; NA
				to place towers 
	*/
	
	//--------------------------------------------------
	
	/*
	Class: Mage
	Group: Mystic
	Health   - 1/5
	Resource - Mana ; 5/5
	Gold;    - 0/5
	*/
	case CLASS.MAGE:
	
	break;
	
	/*
	Class: Shamen
	Group: Doomed
	Health   - 3/5
	Resource - ? ; 3/5
	Gold;    - 2/5
	*/
	case CLASS.SHAMEN:
	
	break;
	
	/*
	Class: Cleric
	Group: Blessed
	Health   - 5/5
	Resource - ? ; 2/5
	Gold;    - 2/5
	*/
	case CLASS.CLERIC:
	
	break;
	
	/*
	Class: Occult
	Group: Cursed
	Health   - 4/5
	Resource - Blood ; 0/5
	Gold;    - 2/5
	*/
	case CLASS.OCCULT:
	
	break;
}