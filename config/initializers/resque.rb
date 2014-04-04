require 'resque_scheduler'
Resque.schedule = YAML.load_file Rails.root.join("config", "resque_schedule.yml")
Resque.redis = REDIS