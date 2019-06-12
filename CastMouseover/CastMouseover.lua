function CastMouseover(spell)
    local hadTarget = UnitExists("target")
    local f = GetMouseFocus()

    if (UnitIsVisible(f.unit) and UnitReaction(f.unit, "player") < 5) then
        target = f.unit
    elseif (UnitIsVisible("mouseover") and UnitReaction("mouseover", "player") < 5) then
        target = "mouseover"
    end
    
    if (UnitExists(target)) then
        if (target ~= "target") then
            TargetUnit(target)
            CastSpellByName(spell)
            if (hadTarget) then
                TargetLastTarget()     
            else
                ClearTarget()
            end
        else
            CastSpellByName(spell)
        end
    end
end