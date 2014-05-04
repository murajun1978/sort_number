require 'nkf'

class Number
  def initialize(arg)
    @one_num, @two_num, @three_num = zen_to_han(arg).split(" "){:to_i}
  end

  def ascending
    type_filter(@one_num, @two_num, @three_num)
    [@one_num, @two_num, @three_num].sort.join(" ")
  end

  def type_filter(*check_value)
    check_value.map{ |v| raise unless v =~ /\d+/ }
  end

  def zen_to_han(char)
    NKF.nkf('-m0Z1 -w', char)
  end
end
