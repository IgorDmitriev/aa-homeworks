require 'set'
require 'byebug'
class Board
  attr_accessor :cups
  attr_reader :player1, :player2

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14)
    @cups.map!.with_index do |_, idx|
      next([]) if idx == 6 || idx == 13
      [:stone, :stone, :stone, :stone]
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(1, cups.size)
  end

  def make_move(start_pos, current_player_name)
    # case current_player_name
    # when player1
    #   idxs = (0..13).to_a.reject { |idx| idx == 13 }
    # when player2
    #   return if start_pos.between?(0, 6)
    # end

    # p "Start pos: #{start_pos}"
    # p "Player: #{current_player_name}"
    # render
    idx = start_pos
    until cups[start_pos].empty?
      idx = (idx + 1) % 14
      next if player1 == current_player_name && idx == 13 #player 1
      next if player2 == current_player_name && idx == 7 #player 2
      cups[idx] << cups[start_pos].pop
    end
    # p ' after '
    render
    return :switch if cups[idx].size == 1
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
