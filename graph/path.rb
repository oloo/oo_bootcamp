class Path
  attr_reader :links

  def initialize()
    @links =  []
    @total_cost = 0
  end

  def prepend(link, cost)
    @links.unshift(link)
    @total_cost += cost
  end

  def cost
    @total_cost
  end

  def hop_count
    @links.size
  end
end
