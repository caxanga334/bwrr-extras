/**
 * Spawns a weapon on a client using TF2Items extension
 * 
 * @param client         The client that will receive the weapon
 * @param classname      The weapon's classname
 * @param index          The weapon's item definition index
 * @param level          The weapon's item level
 * @param quality        The weapon's item quality
 * @param attributes     List of comma separated attributes (format: index, value)
 * @param IsWearable     Is this weapon a wearable entity
 * @param flags          TF2Items flags
 * @return               The weapon's entity index or -1 on failure
 */
int SpawnWeapon(int client, char[] classname, int index, int level, int quality, const char[] attributes, bool IsWearable = false, int flags = OVERRIDE_ALL|FORCE_GENERATION|PRESERVE_ATTRIBUTES)
{
	Handle hWeapon = TF2Items_CreateItem(flags);
	TF2Items_SetClassname(hWeapon, classname);
	TF2Items_SetItemIndex(hWeapon, index);
	TF2Items_SetLevel(hWeapon, level);
	TF2Items_SetQuality(hWeapon, quality);
	
	char attribs[40][16];
	int attribcount = ExplodeString(attributes, ",", attribs, sizeof(attribs), sizeof(attribs[]));
	if(attribcount >= 2)
	{
		TF2Items_SetNumAttributes(hWeapon, attribcount/2);
		int y = 0;
		for(int i = 0;i < attribcount;i+= 2)
		{
			TF2Items_SetAttribute(hWeapon, y, StringToInt(attribs[i]), StringToFloat(attribs[i+1]));
			y++;
			
			if(y == 15)
			{
				LogStackTrace("Error. Weapon given to client \"%L\" \"%s (%i)\" has 16 or more attributes!", client, classname, index);
				break;
			}
		}
	}
	else
	{
		TF2Items_SetNumAttributes(hWeapon, 0);
	}
	
	if (hWeapon==null)
		return INVALID_ENT_REFERENCE;
		
	int entity = TF2Items_GiveNamedItem(client, hWeapon);
	delete hWeapon;
	
	if(IsValidEntity(entity))
	{
		if(IsWearable)
		{
			TF2Util_EquipPlayerWearable(client, entity);
		}
		else
		{
			EquipPlayerWeapon(client, entity);
		}
	}
	
	return entity;
}

void TF2_SetHealth(int client, float maxhealth, TFClassType class)
{
	float value = maxhealth - TF2_GetBaseClassHealth(class);

	TF2Attrib_SetByName(client, "max health additive bonus", value);
}

float TF2_GetBaseClassHealth(TFClassType class)
{
	switch(class)
	{
		case TFClass_Scout, TFClass_Engineer, TFClass_Sniper, TFClass_Spy: return 125.0;
		case TFClass_Soldier: return 200.0;
		case TFClass_Pyro, TFClass_DemoMan: return 175.0;
		case TFClass_Heavy: return 300.0;
		case TFClass_Medic: return 150.0;
		default: return 150.0;
	}
}

// Dynamically limit the boss health if there are less than 6 players
void TF2_SetBossHealth(int client, float maxhealth, TFClassType class)
{
	int inred = GetTeamClientCount(view_as<int>(TFTeam_Red));
	float value = maxhealth - TF2_GetBaseClassHealth(class);
	float subtraction = value/6.0;

	if(inred < 6)
	{
		value = value - (subtraction * float(6 - inred));
	}

	value = Math_Clamp(value, 8000.0, 150000.0);

	TF2Attrib_SetByName(client, "max health additive bonus", value);
}

/**
 * Applies health regen attribute on the client scaling the value dynamically based on player count
 * 
 * @param client       Client index to apply the attribute to
 * @param maxregen     Maximum health regen value
 * @param minred       If the RED player count is less than this, then don't apply at all
 */
void TF2_SetScaledHealthRegen(int client, float maxregen, int minred = 3)
{
	int inred = GetTeamClientCount(view_as<int>(TFTeam_Red));
	float subtraction = maxregen/6.0;

	if(inred < minred) 
		return;

	float value = maxregen - (subtraction * float(6 - inred));
	TF2Attrib_SetByName(client, "health regen", value);
}