class Link

  COUNT = lambda { |ignore| 1 }
  COST = lambda { |cost| cost }

  def initialize(target, cost)
    @target, @cost = target, cost
  end

  def _cost(destination, visited_nodes, cost_strategy)
    @target._cost(destination, visited_nodes, cost_strategy) + cost_strategy.call(@cost)
  end

  def _path(destination, visited_nodes)
    @target._path(destination, visited_nodes).tap do |result|
      result.prepend(self, @cost) unless result.nil?
    end
  end

end
