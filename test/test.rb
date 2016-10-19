module Test
  extend self
  require 'stringio'

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

  def capture_stdout(&blk)
    old = $stdout
    $stdout = fake = StringIO.new
    blk.call
    fake.string
  ensure
    $stdout = old
  end

  def capture_stderr(&blk)
    old = $stderr
    $stderr = fake = StringIO.new
    blk.call
    fake.string
  ensure
    $stderr = old
  end
  
end
