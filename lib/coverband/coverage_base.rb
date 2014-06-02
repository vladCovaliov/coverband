module Coverband
  class CoverageBase < Base

    def initialize(options = {})
      super(options)
    end
    
    def stop
      @enabled = false
    end

    protected

    def record_coverage
      if @enabled
        set_tracer
      else
        #
      end
      @stats.increment "coverband.request.recorded.#{@enabled}" if @stats
    rescue RuntimeError => err
      if @verbose
        @logger.info "error stating recording coverage"
        @logger.info "error: #{err.inspect} #{err.message}"
      end
    end

    def set_tracer
      unless @tracer_set
        Coverage.start
        @tracer_set = true
      end
    end

    def unset_tracer
      if @tracer_set
        coverage_files = Coverage.result
        @logger.info "Coverage.result non empty data:"
        coverage_files.each_pair do |key,val|
                     @logger.info "#{key}: #{val.join(',')}" if val.any?
                      end
        coverage_files.each do |file,lines|
                        lines.each_with_index do |hit,index|
                               add_file(file,index+1) if hit!=nil && hit > 0
                             end
              end
        @tracer_set = false
      end
    end
    
  end
end
