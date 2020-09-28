function refuel() 
    if turtle.getFeulLevel() <= 10 then 
        turtle.select(16)
        turtle.refuel(2)
        turtle.select(1)
    end
end