require "mscorlib"
require "System.Collections.Generic, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

class Space
  def initialize()
  end
end

class ParkingLot
  def initialize()
  end

  def reserveSpace(sp)
  end

  #It will find if there is space in the 
  #unreserved map 
  #If yes, then we will pick that element and 
  #put into the reserved map with the current time value.
  def unreserveSpace(sp)
  end
end
# It will find the entry in reserve map 
# if yes then we will pick that 
# Element and put into the unreserved map. 
# And return the charge units with the current time value.
class Machine
end

class Person
end

class System
  def initialize()
  end

  def getMachine(machineId)
    return @machineIdToMachineMap[machineId]
  end

  def getPerson(personId)
    machienId = @personIdToMachineIdMap[personId]
    m = @machineIdToMachineMap[machienId]
    return m.getPersonWithId(personId)
  end
end

