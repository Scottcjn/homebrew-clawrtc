# frozen_string_literal: true

require "minitest/autorun"

module Language
  module Python
    module Virtualenv
    end
  end
end

class Formula
  class ResourceDsl
    attr_reader :url_value, :sha256_value

    def url(value)
      @url_value = value
    end

    def sha256(value)
      @sha256_value = value
    end
  end

  class << self
    attr_reader :desc_value, :homepage_value, :url_value, :sha256_value,
                :license_value, :dependencies, :resources, :test_block

    def desc(value)
      @desc_value = value
    end

    def homepage(value)
      @homepage_value = value
    end

    def url(value)
      @url_value = value
    end

    def sha256(value)
      @sha256_value = value
    end

    def license(value)
      @license_value = value
    end

    def depends_on(value)
      @dependencies ||= []
      @dependencies << value
    end

    def resource(name, &block)
      @resources ||= {}
      resource = ResourceDsl.new
      resource.instance_eval(&block)
      @resources[name] = resource
    end

    def test(&block)
      @test_block = block
    end
  end
end

load File.expand_path("../Formula/clawrtc.rb", __dir__)

class ClawrtcFormulaTest < Minitest::Test
  def test_formula_metadata
    assert_equal "Mine RTC tokens with your AI agent - Proof of Antiquity consensus", Clawrtc.desc_value
    assert_equal "https://bottube.ai", Clawrtc.homepage_value
    assert_equal "https://files.pythonhosted.org/packages/source/c/clawrtc/clawrtc-1.6.0.tar.gz", Clawrtc.url_value
    assert_equal "2c94df74f1647d5f3a245a288936687cba41e770da392808c2eff36e653d5d24", Clawrtc.sha256_value
    assert_equal "MIT", Clawrtc.license_value
    assert_includes Clawrtc.dependencies, "python@3"
  end

  def test_requests_resource_metadata
    requests = Clawrtc.resources.fetch("requests")

    assert_equal "https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz", requests.url_value
    assert_equal "942c5a758f98d790eaed1a29cb6eefc7f0edf3fcb0fce8b0511f7a990d33c1f6", requests.sha256_value
  end

  def test_caveats_include_quick_start_and_hardware_notes
    caveats = Clawrtc.new.caveats

    assert_includes caveats, "ClawRTC mines RustChain tokens"
    assert_includes caveats, "Apple Silicon (M1/M2/M3): 1.2x"
    assert_includes caveats, "clawrtc install --wallet my-agent"
    assert_includes caveats, "clawrtc start"
  end

  def test_formula_defines_homebrew_test_block
    assert_instance_of Proc, Clawrtc.test_block
  end
end
