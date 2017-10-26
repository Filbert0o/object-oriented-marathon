class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :cages, :employees
  def initialize(name, season_open, season_close)
    @name = name
    @season_open = season_open
    @season_close = season_close
    @cages = []
    @employees = []

    add_cage(10)
  end

  def add_cage(num)
    num.times do
      @cages << Cage.new
    end
    @cages
  end

  def add_employee(human)
    @employees << human
  end

  def open?(date)
    if @season_open <= date && date <= @season_close
      true
    else
      false
    end
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    result = ""
    @employees.each do |employee|
      result += "#{employee.greet}\n"
    end

    @cages.each do |cage|
      if !cage.empty?
        result += cage.animal.speak + "\n"
      end
    end

    result
  end
end
