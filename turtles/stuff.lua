ignore = {
    ["minecraft:gravel"] = true,
    ["minecraft:sand"] = true,
    ["minecraft:grass"] = true,
    ["minecraft:dirt"] = true,
    ["minecraft:stone"] = true,
    ["diamondglass:diamond_sand"] = true
}
moves = {}
function refuel() 
    if turtle.getItemCount(16) <= 5 then
        returnBase()
    if turtle.getFuelLevel() <= 50 then 
        turtle.select(16)
        turtle.refuel(1)
        turtle.select(1)
    end
end
function isTrash()
    local info = turtle.inspect()
    if info and ignore[info.name] then
        return true
    elseif info then
        return false
    else
        return false
    end
end
function isTrashUp()
    local info = turtle.inspectUp()
    if info and ignore[info.name] then
        return true
    elseif info then
        return false
    else
        return false
    end
end
function isTrashDown()
    local info = turtle.inspectDown()
    if info and ignore[info.name] then
        return true
    elseif info then
        return false
    else
        return false
    end
end
function isBlock()
    if turtle.detect() then
        return true
    else 
        return false
    end
end
function isBlockUp()
    if turtle.detectDown() then
        return true
    else 
        return false
    end
end
function isBlockDown()
    if turtle.detectDown() then
        return true
    else 
        return false
    end
end
function inventoryFull()
    result = true
    for i=15,1,-1 do 
        if turtle.getItemSpace(i) ~= 0 then
            result = false
        end
    end
    return result
end
function moveForward()
    refuel()
    if inventoryFull() then
        returnBase()
    else
        turtle.dig()
        table.insert(moves, 1)
        turtle.forward()
    end
end
function moveLeft()
    table.insert(moves, 2)
    turtle.turnLeft()
end
function moveRight()
    table.insert(moves, 3)
    turtle.turnLeft()
end
function moveUp()
    refuel()
    if inventoryFull() then
        returnBase()
    else
        turtle.dig()
        table.insert(moves, 4)
        turtle.up()
    end
end
function moveDown()
    refuel()
    if inventoryFull() then
        returnBase()
    else
        turtle.dig()
        table.insert(moves, 4)
        turtle.down()
    end
end

--[[1 is forward
2 is left
3 is right
4 is up
5 is down

--]]