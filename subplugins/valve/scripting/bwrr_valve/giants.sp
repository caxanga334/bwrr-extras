/*----------------------------------------------
-------------------Giant Robots------------------
----------------------------------------------*/

void GiveInventory_Giant_Scout(int client, int index)
{
	TF2Attrib_SetByName(client, "damage force reduction", 0.7);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.7);
	TF2Attrib_SetByName(client, "override footstep sound set", 5.0);

	switch(index)
	{
		case 0: /* Giant Scout */
		{
			SpawnWeapon(client, "tf_weapon_scattergun", 200, 1, 6, "", false);
			TF2_SetHealth(client, 1600.0, TFClass_Scout);
		}
	}
}

void GiveInventory_Giant_Soldier(int client, int index)
{
	TF2Attrib_SetByName(client, "move speed bonus", 0.5);
	TF2Attrib_SetByName(client, "damage force reduction", 0.4);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.4);
	TF2Attrib_SetByName(client, "override footstep sound set", 3.0);

	switch(index)
	{
		case 0: /* Giant Soldier */
		{
			SpawnWeapon(client, "tf_weapon_rocketlauncher", 205, 1, 6, "", false);
			TF2_SetHealth(client, 3800.0, TFClass_Soldier);
		}
	}	
}

void GiveInventory_Giant_Pyro(int client, int index)
{
	TF2Attrib_SetByName(client, "move speed bonus", 0.5);
	TF2Attrib_SetByName(client, "damage force reduction", 0.6);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.6);
	TF2Attrib_SetByName(client, "override footstep sound set", 6.0);

	switch(index)
	{
		case 0: /* Giant Pyro */
		{
			SpawnWeapon(client, "tf_weapon_flamethrower", 208, 1, 6, "", false);
			TF2_SetHealth(client, 3000.0, TFClass_Pyro);
		}
	}	
}

void GiveInventory_Giant_Demoman(int client, int index)
{
	TF2Attrib_SetByName(client, "move speed bonus", 0.5);
	TF2Attrib_SetByName(client, "damage force reduction", 0.5);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.5);
	TF2Attrib_SetByName(client, "override footstep sound set", 4.0);

	switch(index)
	{
		case 0: /* Giant Rapid Fire Demoman */
		{
			SpawnWeapon(client, "tf_weapon_grenadelauncher", 206, 1, 6, "318,-0.4,6,0.75", false);
			TF2_SetHealth(client, 3300.0, TFClass_DemoMan);
		}
		case 1: /* Giant Rapid Fire Demoman */
		{
			SpawnWeapon(client, "tf_weapon_grenadelauncher", 206, 1, 6, "6,0.5", false);
			TF2_SetHealth(client, 3000.0, TFClass_DemoMan);
		}
	}	
}

void GiveInventory_Giant_Heavy(int client, int index)
{
	TF2Attrib_SetByName(client, "move speed bonus", 0.5);
	TF2Attrib_SetByName(client, "damage force reduction", 0.3);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.3);
	TF2Attrib_SetByName(client, "override footstep sound set", 2.0);

	switch(index)
	{
		case 0: /* Giant Heavy */
		{
			SpawnWeapon(client, "tf_weapon_minigun", 202, 1, 6, "2,1.5", false);
			TF2_SetHealth(client, 5000.0, TFClass_Heavy);
		}
		case 1: /* Giant Deflector Heavy */
		{
			SpawnWeapon(client, "tf_weapon_minigun", 850, 1, 6, "2,1.5,323,1.0", false);
			SpawnWeapon(client, "tf_wearable", 840, 1, 6, "", true);
			TF2_SetHealth(client, 5000.0, TFClass_Heavy);
		}
	}	
}

void GiveInventory_Giant_Engineer(int client, int index)
{
	TF2Attrib_SetByName(client, "move speed bonus", 0.5);
	TF2Attrib_SetByName(client, "damage force reduction", 0.7);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.7);
	TF2Attrib_SetByName(client, "override footstep sound set", 5.0);

	switch(index)
	{
		case 0: /* Standard Scout */
		{
			SpawnWeapon(client, "tf_weapon_scattergun", 200, 1, 6, "", false);
		}
	}	
}

void GiveInventory_Giant_Medic(int client, int index)
{
	TF2Attrib_SetByName(client, "move speed bonus", 0.5);
	TF2Attrib_SetByName(client, "damage force reduction", 0.6);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.6);

	SpawnWeapon(client, "tf_weapon_syringegun_medic", 204, 1, 6, "1,0.1", false);
	switch(index)
	{
		case 0: /* Giant Medic */
		{
			SpawnWeapon(client, "tf_weapon_medigun", 411, 1, 6, "8,200.0", false);
			TF2_SetHealth(client, 4500.0, TFClass_Medic);
		}
	}
}

void GiveInventory_Giant_Sniper(int client, int index)
{
	TF2Attrib_SetByName(client, "damage force reduction", 0.7);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.7);
	TF2Attrib_SetByName(client, "override footstep sound set", 5.0);

	switch(index)
	{
		case 0: /* Standard Scout */
		{
			SpawnWeapon(client, "tf_weapon_scattergun", 200, 1, 6, "", false);
		}
	}
}

void GiveInventory_Giant_Spy(int client, int index)
{
	TF2Attrib_SetByName(client, "damage force reduction", 0.7);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.7);
	TF2Attrib_SetByName(client, "override footstep sound set", 5.0);

	switch(index)
	{
		case 0: /* Standard Scout */
		{
			SpawnWeapon(client, "tf_weapon_scattergun", 200, 1, 6, "", false);
		}
	}
}

void GiveInventory_SentryBuster(int client)
{
	TF2Attrib_SetByName(client, "damage force reduction", 0.5);
	TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.5);
	TF2Attrib_SetByName(client, "override footstep sound set", 7.0);
	TF2Attrib_SetByName(client, "cannot be backstabbed", 1.0);
	TF2Attrib_SetByName(client, "move speed bonus", 2.0);
	TF2Attrib_SetByName(client, "cannot pick up intelligence", 1.0);
	TF2_SetHealth(client, 2500.0, TFClass_DemoMan);

	SpawnWeapon(client, "tf_weapon_stickbomb", 307, 1, 6, "", false);
}

void GiveInventory_Boss(int client, int index, TFClassType class)
{
	switch(class)
	{
		case TFClass_Soldier:
		{
			TF2Attrib_SetByName(client, "move speed bonus", 0.5);
			TF2Attrib_SetByName(client, "damage force reduction", 0.4);
			TF2Attrib_SetByName(client, "airblast vulnerability multiplier", 0.4);
			TF2Attrib_SetByName(client, "override footstep sound set", 3.0);
			TF2Attrib_SetByName(client, "airblast vertical vulnerability multiplier", 0.1);
			TF2Attrib_SetByName(client, "rage giving scale", 0.1);

			switch(index)
			{
				case 0: /* Sergeant Crits */
				{
					TF2_SetBossHealth(client, 60000.0, class);
					TF2_SetScaledHealthRegen(client, 250.0, 6);
					SpawnWeapon(client, "tf_weapon_rocketlauncher", 205, 1, 6, "2, 1.5, 318, 0.6, 6, 0.2, 440, 7.0, 103, 1.3", false);
				}
			}
		}
	}
}