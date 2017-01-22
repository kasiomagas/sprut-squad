enableSaving [false,false];

fnc_packMortar = compile preprocessFile "fnc_packMortar.sqf";
fnc_unpackMortar = compile preprocessFile "fnc_unpackMortar.sqf";



private _group = createGroup west;
private _pos = player getRelPos [20, 0];
private _randomDir = random 360;
private _wp1 = _group addWaypoint [_pos getPos [20, _randomDir], 10];
_wp1 setWaypointType "MOVE";

private _wp2 = _group addWaypoint [_pos getPos [20, _randomDir - 180], 10];
_wp2 setWaypointType "MOVE";
private _leader = _group createUnit ["B_Soldier_TL_F", _pos, [], 0, "NONE"];
private _gunner = _group createUnit ["B_Support_GMG_F", _pos, [], 0, "NONE"];
private _assistant = _group createUnit ["B_Support_AMG_F", _pos, [], 0, "NONE"];
units _group doFollow _leader;


_gunner addEventHandler ["WeaponAssembled",
{
	_this select 0 action ["GetInGunner", _this select 1];
}];
