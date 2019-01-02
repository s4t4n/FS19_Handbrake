-- ls17 zu ls19 konvertieren
handBrake = {};
handBrake.handBrakeDir = g_currentModDirectory;

function handBrake.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(Motorized, specializations);
end;

function handBrake:load(xmlFile)
	self.handBrakeState  = true;
	self.handBrakeSwitch = false;
	
	local iconW = g_currentMission.vehicleHudBg.height*0.15/g_screenAspectRatio;
	local iconH = g_currentMission.vehicleHudBg.height*0.15;
	local iconX = g_currentMission.vehicleHudBg.x + iconW*0.5;
	local iconY = g_currentMission.vehicleHudBg.y + iconW*0.2;
	
	self.handBrakeIcon = Overlay:new("handBrakeIcon", Utils.getFilename("handBrakeIcon.dds", handBrake.handBrakeDir), iconX, iconY, iconW, iconH);
end;

function handBrake:delete()
end;

function handBrake:mouseEvent(posX, posY, isDown, isUp, button)
end;

function handBrake:keyEvent(unicode, sym, modifier, isDown)
end;

function handBrake:updateTick(dt)
end;

function handBrake:update(dt)
	if g_currentMission.controlledVehicle == self then
		if InputBinding.hasEvent(InputBinding.handBrakeKey) then
			self.handBrakeState = not self.handBrakeState;
		end;
	end;
	
	if self.handBrakeState then
		for k, wheel in pairs(self.wheels) do
			setWheelShapeProps(wheel.node, wheel.wheelShape, 0, 999, wheel.steeringAngle, wheel.rotationDamping);
		end;
		self.handBrakeIcon:setColor(1.0000, 0.4910, 0.0000, 1);
		self.handBrakeSwitch = true;
		doHandbrake = true;
	else
		if self.handBrakeSwitch then
			for k, wheel in pairs(self.wheels) do
				setWheelShapeProps(wheel.node, wheel.wheelShape, 0, 0, wheel.steeringAngle, wheel.rotationDamping);
			end;
			self.handBrakeIcon:setColor(0.2705, 0.6514, 0.0802, 1);
			self.handBrakeSwitch = false;
			doHandbrake = false;
		end;
	end;
end;

function handBrake:draw()
	self.handBrakeIcon:render();
	g_currentMission:addHelpButtonText(g_i18n:getText("input_handBrakeKey"), InputBinding.handBrakeKey, nil, GS_PRIO_LOW);
end;

function handBrake:onLeave()
end;