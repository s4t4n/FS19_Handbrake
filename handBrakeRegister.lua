-- requied register?
handBrakeRegister = {};

SpecializationUtil.registerSpecialization("handBrake", "handBrake", g_currentModDirectory.."handBrake.lua");

function handBrakeRegister:loadMap(name)
	for k, v in pairs(VehicleTypeUtil.vehicleTypes) do  
		if v ~= nil then
			for i = 1, table.maxn(v.specializations) do
				local vs = v.specializations[i];
				if vs ~= nil and vs == SpecializationUtil.getSpecialization("steerable") then
					table.insert(v.specializations, SpecializationUtil.getSpecialization("handBrake"));
				end;
			end;
		end;
	end;
end;

function handBrakeRegister:deleteMap()
end;

function handBrakeRegister:mouseEvent(posX, posY, isDown, isUp, button)
end;

function handBrakeRegister:keyEvent(unicode, sym, modifier, isDown)
end;

function handBrakeRegister:update(dt)
end;

function handBrakeRegister:draw()
end;

addModEventListener(handBrakeRegister);