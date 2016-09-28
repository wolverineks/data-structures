module Test
  extend self

  def test(string, expected, actual)
    puts string
    display_results(expected, actual)
  end

  def display_results(expected, actual)
    puts "Expected: #{expected}"
    puts "Actual:   #{actual}"
    puts expected == actual ? "PASS" : "FAIL"
    puts "----------------------------------"
  end

end
