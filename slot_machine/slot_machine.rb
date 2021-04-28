class SlotMachine
  ICONS= %w[cherry seven bell star joker]

  POINTS = {
    'joker' => 50,
    'star' => 40,
    'bell' => 30,
    'seven' => 20,
    'cherry' => 10
  }

  def initialize(reels = [])
    # if we type slot_machine = SlotMachine.new @reels will be []
    @reels = reels
  end

  def score
    if same_icon_thrice?
      icon = @reels[0]
      return POINTS[icon]
    elsif same_icon_twice_plus_joker?
      # The duplicate icon will always end up in the middle
      sort_reels = @reels.sort
      return POINTS[sort_reels[1]] / 2
    else
      return 0
    end
  end

  def play
    # @reels << ICONS.sample
    # @reels << ICONS.sample
    # @reels << ICONS.sample
    3.times { @reels << ICONS.sample }
    return @reels
  end

  private

  def same_icon_thrice?
    return @reels.uniq.length == 1
  end

  def same_icon_twice_plus_joker?
    # @reels could be 2 jokers and any icon @reels = %w[joker joker star]
    # or 2 of a kind plus one joker  @reels = %w[joker bell bell]
    return @reels.uniq.length == 2 && @reels.include?('joker')
  end
end
