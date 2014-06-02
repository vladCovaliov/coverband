module Coverband
  class CoverageMiddleware < CoverageBase

    def initialize(app)
      @app = app
      super
    end

    def call(env)
      configure_sampling
      record_coverage
      results = @app.call(env)
      report_coverage
      results
    end
    
  end
end
