/*----------------------------------------------
-------------------Normal robots------------------
----------------------------------------------*/

void GiveInventory_Normal_Scout(int client, int index)
{
	switch(index)
	{
		case 0: /* Standard Scout */
		{
			SpawnWeapon(client, "tf_weapon_scattergun", 200, 1, 6, "", false);
		}
		case 1: /* Melee Scout */
		{
			SpawnWeapon(client, "tf_weapon_bat", 190, 1, 6, "", false);
		}
		case 2: /* Sandman Scout */
		{
			SpawnWeapon(client, "tf_weapon_bat_wood", 44, 1, 6, "", false);
		}
	}
}

void GiveInventory_Normal_Soldier(int client, int index)
{
	switch(index)
	{
		case 0: /* Standard Soldier */
		{
			SpawnWeapon(client, "tf_weapon_rocketlauncher", 205, 1, 6, "", false);
		}
	}	
}

void GiveInventory_Normal_Pyro(int client, int index)
{
	switch(index)
	{
		case 0: /* Standard Pyro */
		{
			SpawnWeapon(client, "tf_weapon_flamethrower", 208, 1, 6, "", false);
		}
	}		
}

void GiveInventory_Normal_Demoman(int client, int index)
{
	switch(index)
	{
		case 0: /* Standard Demoman */
		{
			SpawnWeapon(client, "tf_weapon_grenadelauncher", 206, 1, 6, "", false);
		}
	}		
}

void GiveInventory_Normal_Heavy(int client, int index)
{
	switch(index)
	{
		case 0: /* Standard Heavyweapons */
		{
			SpawnWeapon(client, "tf_weapon_minigun", 202, 1, 6, "", false);
		}
		case 1: /* Steel Gauntlet */
		{
			SpawnWeapon(client, "tf_weapon_fists", 331, 1, 6, "", false);
			TF2_SetHealth(client, 900.0, TFClass_Heavy);
		}
		case 2: /* Heavy Shotgun */
		{
			SpawnWeapon(client, "tf_weapon_shotgun_hwg", 199, 1, 6, "318,0.1,6,2.5,45,3.0,2,0.33", false);
		}
	}		
}

void GiveInventory_Normal_Engineer(int client, int index)
{
	SpawnWeapon(client, "tf_weapon_pistol", 209, 1, 6, "", false);
	SpawnWeapon(client, "tf_weapon_wrench", 197, 1, 6, "", false);
	SpawnWeapon(client, "tf_weapon_pda_engineer_build", 25, 1, 6, "", false);
	SpawnWeapon(client, "tf_weapon_pda_engineer_destroy", 26, 1, 6, "", false);
	SpawnWeapon(client, "tf_weapon_builder", 28, 1, 6, "", false);
	TF2Attrib_SetByName(client, "cannot pick up buildings", 1.0);
	TF2Attrib_SetByName(client, "cannot pick up intelligence", 1.0);

	switch(index)
	{
		case 0: /* Standard Engineer */
		{
			SpawnWeapon(client, "tf_weapon_shotgun_primary", 199, 1, 6, "", false);
			TF2_SetHealth(client, 500.0, TFClass_Engineer);
		}
	}		
}

void GiveInventory_Normal_Medic(int client, int index)
{
	SpawnWeapon(client, "tf_weapon_syringegun_medic", 204, 1, 6, "1,0.1", false);
	switch(index)
	{
		case 0: /* Standard Medic */
		{
			SpawnWeapon(client, "tf_weapon_medigun", 211, 1, 6, "10,2.0", false);
		}
		case 1: /* Quick Uber Medic */
		{
			SpawnWeapon(client, "tf_weapon_medigun", 211, 1, 6, "10,5.0,314,-3.0,8,0.1", false);
		}
		case 2: /* Quick Fix Medic */
		{
			SpawnWeapon(client, "tf_weapon_medigun", 411, 1, 6, "", false);
		}
		case 3: /* Mega Heal Medic */
		{
			SpawnWeapon(client, "tf_weapon_medigun", 411, 1, 6, "8,10.0", false);
		}
	}		
}

void GiveInventory_Normal_Sniper(int client, int index)
{
	SpawnWeapon(client, "tf_weapon_club", 193, 1, 6, "", false);

	if(Math_GetRandomInt(0,1) == 1) // 50% to spawn with a razorback
	{
		SpawnWeapon(client, "tf_wearable_razorback", 57, 1, 6, "", true);
	}

	switch(index)
	{
		case 0: /* Standard Sniper */
		{
			SpawnWeapon(client, "tf_weapon_sniperrifle", 201, 1, 6, "", false);
			TF2Attrib_SetByName(client, "cannot pick up intelligence", 1.0);
		}
		case 1: /* Sydney Sleeper Sniper */
		{
			SpawnWeapon(client, "tf_weapon_sniperrifle", 230, 1, 6, "", false);
			TF2Attrib_SetByName(client, "cannot pick up intelligence", 1.0);
		}
		case 2: /* Bowman */
		{
			SpawnWeapon(client, "tf_weapon_compound_bow", 56, 1, 6, "2,0.5", false);
		}
		case 3: /* Bowman Rapid Fire */
		{
			SpawnWeapon(client, "tf_weapon_compound_bow", 56, 1, 6, "6,0.6", false);
			TF2Attrib_SetByName(client, "head scale", 0.7);
			TF2Attrib_SetByName(client, "move speed bonus", 0.85);
			TF2_SetHealth(client, 1200.0, TFClass_Sniper);
		}
	}
}

void GiveInventory_Normal_Spy(int client, int index)
{
	SpawnWeapon(client, "tf_weapon_revolver", 210, 1, 6, "", false);
	SpawnWeapon(client, "tf_weapon_builder", 735, 1, 6, "", false);
	SpawnWeapon(client, "tf_weapon_pda_spy", 27, 1, 6, "", false);
	SpawnWeapon(client, "tf_weapon_invis", 212, 1, 6, "", false);
	TF2Attrib_SetByName(client, "cannot pick up intelligence", 1.0);

	switch(index)
	{
		case 0: /* Standard Spy */
		{
			SpawnWeapon(client, "tf_weapon_knife", 194, 1, 6, "", false);
		}
	}		
}