class Stage
  attr_reader :id, :name, :location, :capacity
  @@stages = {}
  @@stage_id = 0

  def initialize(id, name, location, capacity)
    @id = id || @@stage_id += 1
    @name = name
    @location = location
    @capacity = capacity
  end
  
  def self.all
    @@stages.values()
  end

  def save
    @@stages[self.id] = Stage.new(self.id, self.name, self.location, self.capacity)
  end
  
  def self.clear
    @@stages = {}
    @@stage_id = 0
  end

  def ==(stage_to_compare)
    self.name() == stage_to_compare.name
  end

  def self.find(id)
    @@stages[id]
  end

  def update(name, location, capacity)
    @name = name
    @location = location
    @capacity = capacity

  end
  
  def delete
    @@stages.delete(self.id)
  end


end