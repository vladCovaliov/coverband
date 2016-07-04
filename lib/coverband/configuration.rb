module Coverband
  class Configuration
    attr_accessor :redis, :coverage_baseline, :root_paths, :root, :ignore, :percentage, :verbose, :reporter, :stats, :logger, :startup_delay, :baseline_file, :trace_point_events, :include_gems, :memory_caching, :s3_bucket, :path_replace

    def initialize
      @root = Dir.pwd
      @redis = nil
      @stats = nil
      @coverage_baseline = {}
      @baseline_file = './tmp/coverband_baseline.json'
      @root_paths = []
      @ignore = []
      @include_gems = false
      @percentage = 0.0
      @verbose = false
      @reporter = 'scov'
      @logger = Logger.new(STDOUT)
      @startup_delay = 0
      @trace_point_events = [:line]
      @memory_caching = false
      @path_replace = ['','']
    end

    def logger
      @logger ||= Logger.new(STDOUT)
    end

  end
end
