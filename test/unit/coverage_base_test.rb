require File.expand_path('../test_helper', File.dirname(__FILE__))

class CoverageBaseTest < Test::Unit::TestCase

  should "start should enable coverage" do
    coverband = Coverband::CoverageBase.new
    assert_equal false, coverband.instance_variable_get("@enabled")
    coverband.expects(:record_coverage).once
    coverband.start
    assert_equal true, coverband.instance_variable_get("@enabled")
  end

end
