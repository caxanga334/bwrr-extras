#pragma newdecls required
#pragma semicolon 1

#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>
#include <tf2attributes>
#include <tf2utils>
#include <tf2items>
#include <bwrr_stocks>
#include <bwrr_api>
#include <smlib/math>

#define MY_PLUGIN_NAME "bwrr_valve_templates"

int g_MyPluginID = -1;
bool g_managed[MAXPLAYERS + 1]; // Client robot is managed by this plugin

#include "bwrr_valve/utils.sp"
#include "bwrr_valve/normals.sp"
#include "bwrr_valve/giants.sp"

public Plugin myinfo =
{
	name = "[BWRR] Valve Templates",
	author = "caxanga334",
	description = "Adds valve robots templates to Be With Robots Redux",
	version = "1.0.0",
	url = "https://github.com/caxanga334/tf-bewithrobots-redux"
};

public void OnAllPluginsLoaded()
{
	g_MyPluginID = BWRR_RegisterRobotPlugin(MY_PLUGIN_NAME);
	LogMessage("[BWRR VALVE TEMPLATES] Received Plugin ID = %i", g_MyPluginID);
	RegisterRobots();
}

public void OnClientPutInServer(int client)
{
	g_managed[client] = false;
}

public void OnClientDisconnect(int client)
{
	g_managed[client] = false;
}

void RegisterRobots()
{
	// Normals -- plugin id, class, cost, index, type, supply, wave percentage
	// scouts
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Scout, 100, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.22);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Scout, 50, 1, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.0);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Scout, 80, 2, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.0);

	// soldiers
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Soldier, 200, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.0);

	// pyros
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Pyro, 150, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.0);

	// demomans
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_DemoMan, 150, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.0);

	// heavies
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Heavy, 300, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.0);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Heavy, 600, 1, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.39);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Heavy, 400, 2, BWRR_RobotType_Normal, -1, BWRR_Role_Attack, 0.28);

	// engineers
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Engineer, 400, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Engineer, 0.0);

	// medics
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Medic, 250, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Healer, 0.0);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Medic, 300, 1, BWRR_RobotType_Normal, -1, BWRR_Role_Healer, 0.55);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Medic, 200, 2, BWRR_RobotType_Normal, -1, BWRR_Role_Healer, 0.0);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Medic, 350, 3, BWRR_RobotType_Normal, -1, BWRR_Role_Healer, 0.55);

	// snipers
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Sniper, 175, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Sniper, 0.0);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Sniper, 190, 1, BWRR_RobotType_Normal, -1, BWRR_Role_Sniper, 0.33);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Sniper, 200, 2, BWRR_RobotType_Normal, -1, BWRR_Role_AttackSupport, 0.33);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Sniper, 950, 3, BWRR_RobotType_Normal, -1, BWRR_Role_AttackSupport, 0.45);

	// spies
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Spy, 175, 0, BWRR_RobotType_Normal, -1, BWRR_Role_Spy, 0.0);

	// Giants -- plugin id, class, cost, index, type, supply, wave percentage
	// scouts
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Scout, 1400, 0, BWRR_RobotType_Giant, -1, BWRR_Role_Attack, 0.33);

	// soldiers
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Soldier, 2200, 0, BWRR_RobotType_Giant, -1, BWRR_Role_Attack, 0.33);

	// pyros
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Pyro, 2000, 0, BWRR_RobotType_Giant, -1, BWRR_Role_Attack, 0.33);

	// demomans
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_DemoMan, 2100, 0, BWRR_RobotType_Giant, -1, BWRR_Role_Attack, 0.33);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_DemoMan, 2100, 1, BWRR_RobotType_Giant, -1, BWRR_Role_Attack, 0.33);

	// heavies
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Heavy, 4000, 0, BWRR_RobotType_Giant, -1, BWRR_Role_Attack, 0.45);
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Heavy, 4400, 1, BWRR_RobotType_Giant, -1, BWRR_Role_Attack, 0.68);

	// medics
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Medic, 7500, 0, BWRR_RobotType_Giant, -1, BWRR_Role_Healer, 0.68);

	// Busters
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_DemoMan, 0, 0, BWRR_RobotType_Buster, -1, BWRR_Role_Generic, 0.0);

	// Bosses
	BWRR_RegisterRobotTemplate(g_MyPluginID, TFClass_Soldier, 50000, 0, BWRR_RobotType_Boss, -1, BWRR_Role_Attack, 0.80);
}

public void BWRR_OnInventoryRequest(int client, const int pluginID, TFClassType class, int index, int type)
{
	if(g_MyPluginID != pluginID)
		return;
	
	switch(type)
	{
		case BWRR_RobotType_Normal: SelectInventory_Normal(client, class, index);
		case BWRR_RobotType_Giant: SelectInventory_Giant(client, class, index);
		case BWRR_RobotType_Buster: GiveInventory_SentryBuster(client);
		case BWRR_RobotType_Boss: GiveInventory_Boss(client, index, class);
	}
}

public Action BWRR_OnApplyScale(int client, const int pluginID, TFClassType class, int index, int type, float &scale)
{
	if(g_MyPluginID != pluginID)
		return Plugin_Continue;

	switch(type)
	{
		case BWRR_RobotType_Normal:
		{
			switch(class)
			{
				case TFClass_Heavy:
				{
					switch(index)
					{
						case 1:
						{
							scale = 1.5;
							return Plugin_Changed;
						}
					}
				}
			}
		}
		case BWRR_RobotType_Boss:
		{
			scale = 1.9;
			return Plugin_Changed;
		}
	}

	return Plugin_Continue;	
}

public void BWRR_OnRobotSpawn(int client, const int pluginID, TFClassType class, int index, int type)
{
	if(g_MyPluginID != pluginID)
		return;

	int health = TF2Util_GetEntityMaxHealth(client);
	TF2Util_TakeHealth(client, float(health), 0);
	g_managed[client] = true;

	switch(class)
	{
		case TFClass_Scout:
		{
			SetEntPropFloat(client, Prop_Send, "m_flHypeMeter", 100.0);
		}
		case TFClass_Medic:
		{
			SetEntPropFloat(client, Prop_Send, "m_flRageMeter", 100.0); // Medigun's Shield
			int weapon = TF2Util_GetPlayerLoadoutEntity(client, TFWeaponSlot_Secondary, true);
			if(IsValidEntity(weapon))
			{
				SetEntPropFloat(weapon, Prop_Send, "m_flChargeLevel", 1.0);	
			}			
		}
		case TFClass_Heavy: // Heavy with knockback rage attribute
		{
			SetEntPropFloat(client, Prop_Send, "m_flRageMeter", 100.0);
		}
		case TFClass_Soldier: // Soldier's banner
		{
			SetEntPropFloat(client, Prop_Send, "m_flRageMeter", 100.0);
			SetEntProp(client, Prop_Send, "m_iDecapitations", 10); // Airstrike
		}
		case TFClass_DemoMan: // Eyelander
		{
			SetEntProp(client, Prop_Send, "m_iDecapitations", 5);
		}
		case TFClass_Engineer: // Frontier Justice
		{
			SetEntProp(client, Prop_Send, "m_iRevengeCrits", 35);
		}
		case TFClass_Pyro: // Phlogistinator
		{
			SetEntPropFloat(client, Prop_Send, "m_flRageMeter", 100.0);
		}
		case TFClass_Sniper: // Hitman's Headtaker
		{
			SetEntPropFloat(client, Prop_Send, "m_flRageMeter", 100.0);
			SetEntProp(client, Prop_Send, "m_iDecapitations", 10); // Bazaar Bargain
		}
		case TFClass_Spy: // Diamond Back
		{
			SetEntProp(client, Prop_Send, "m_iRevengeCrits", 35);
		}
	}	
}

public void BWRR_OnRobotDeath(int client, const int pluginID, TFClassType class, int index, int type)
{
	if(g_MyPluginID != pluginID)
		return;

	g_managed[client] = false;	
}

public Action BWRR_OnGiveFlag(int client, const int pluginID, TFClassType class, int index, int type)
{
	if(g_MyPluginID != pluginID)
		return Plugin_Continue;

	switch(class)
	{
		case TFClass_Engineer, TFClass_Medic, TFClass_Spy:
		{
			return Plugin_Handled;
		}
	}

	return Plugin_Continue;
}

public Action OnPlayerRunCmd(int client, int& buttons, int& impulse, float vel[3], float angles[3], int& weapon, int& subtype, int& cmdnum, int& tickcount, int& seed, int mouse[2])
{
	if(g_managed[client])
	{
		if(TF2_GetPlayerClass(client) == TFClass_Spy)
		{
			SetEntPropFloat(client, Prop_Send, "m_flCloakMeter", 100.0);
		}
	}


	return Plugin_Continue;
}

void SelectInventory_Normal(int client, TFClassType class, int index)
{
	switch(class)
	{
		case TFClass_Scout: GiveInventory_Normal_Scout(client, index);
		case TFClass_Soldier: GiveInventory_Normal_Soldier(client, index);
		case TFClass_Pyro: GiveInventory_Normal_Pyro(client, index);
		case TFClass_DemoMan: GiveInventory_Normal_Demoman(client, index);
		case TFClass_Heavy: GiveInventory_Normal_Heavy(client, index);
		case TFClass_Engineer: GiveInventory_Normal_Engineer(client, index);
		case TFClass_Medic: GiveInventory_Normal_Medic(client, index);
		case TFClass_Sniper: GiveInventory_Normal_Sniper(client, index);
		case TFClass_Spy: GiveInventory_Normal_Spy(client, index);
	}
}

void SelectInventory_Giant(int client, TFClassType class, int index)
{
	switch(class)
	{
		case TFClass_Scout: GiveInventory_Giant_Scout(client, index);
		case TFClass_Soldier: GiveInventory_Giant_Soldier(client, index);
		case TFClass_Pyro: GiveInventory_Giant_Pyro(client, index);
		case TFClass_DemoMan: GiveInventory_Giant_Demoman(client, index);
		case TFClass_Heavy: GiveInventory_Giant_Heavy(client, index);
		case TFClass_Engineer: GiveInventory_Giant_Engineer(client, index);
		case TFClass_Medic: GiveInventory_Giant_Medic(client, index);
		case TFClass_Sniper: GiveInventory_Giant_Sniper(client, index);
		case TFClass_Spy: GiveInventory_Giant_Spy(client, index);
	}
}