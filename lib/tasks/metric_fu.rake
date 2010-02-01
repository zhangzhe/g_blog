begin 
  require "metric_fu"
  
  MetricFu::Configuration.run do |config|  
    config.graphs = []
  end
  
rescue LoadError
end
