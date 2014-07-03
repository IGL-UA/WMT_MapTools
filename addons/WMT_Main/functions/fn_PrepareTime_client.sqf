/*
 	Name: WMT_fnc_PrepareTime_client
 	
 	Author(s):
		Zealot

 	Description:
		Server part of prepare time - immobilaze vehicles, timer.

	Parameters:
		0 - time 
		1 - radius of start zone 
 		2 - time to remove markers

 	Returns:
		Nothing 
*/
#include "defines.sqf"

_freeztime = (_this select 0)*60;
_distance = _this select 1;


waitUntil {not isNull player};

if (isNil "WMT_pub_frzState") then { WMT_pub_frzState = 0; };
if (isNil "WMT_pub_frzVoteWait") then { WMT_pub_frzVoteWait = []; };
if (isNil "WMT_pub_frzVoteStart") then { WMT_pub_frzVoteStart = []; };
if (isNil "WMT_pub_frzTimeLeftForced") then { WMT_pub_frzTimeLeftForced = 30; };
if (isNil "WMT_pub_frzTimeLeft") then { WMT_pub_frzTimeLeft = _freeztime; };


if (_freeztime ==0 ) then { WMT_pub_frzState = 3; };

if (WMT_pub_frzState == 0 and _freeztime > 0) then {
	WMT_pub_frzState = 1;
};

if (WMT_pub_frzState >= 3) exitWith {};

[_freeztime, _distance] spawn WMT_fnc_FreezePlayerClient;
[_freeztime] spawn WMT_fnc_FreezeUI;	


