#include <open.mp>
#include <zcmd>


CMD:testarpniu(playerid){
	new
	    panels, doors, lights, tires , vehicleid = GetPlayerVehicleID(playerid);
	GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
	//UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
	printf("Vehicle Status: [Panels]: %d - [Doors]: %d - [Lights]: %d - [Tires]: %d", panels, doors, lights, tires);
	SendClientMessage(playerid, -1, "Vehicle Status: [Panels]: %d - [Doors]: %d - [Lights]: %d - [Tires]: %d", panels, doors, lights, tires);
	return 1;
}