class Dessert
  attr :name,true
  attr :calories,true
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    return true if @calories < 200
    return false
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  attr :flavor,true
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  def delicious?
    return false if @flavor.downcase == "black licorice"
    super
  end
end

j = JellyBean.new("","","black ")
puts j.delicious?
