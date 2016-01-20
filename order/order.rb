# Copyright 2015 by Fred George. May be copied with this notice, but not used in classroom training.

# Understands SOMETHING_DUMMY
class Order

  def self.max(*elements)
    # elements = elements.flatten
    # champion = elements.first
    # elements.each { |challenger| champion = challenger if challenger.better_than? champion}
    # champion
    elements.flatten.reduce do |champion, challenger|  # synonym for 'reduce' is 'inject'
      challenger.better_than?(champion) ? challenger : champion
    end
  end

end