Rails.application.configure do
  config.after_initialize do
    Bullet.enable = true
    Bullet.raise  = true
    Bullet.n_plus_one_query_enable     = true
    Bullet.unused_eager_loading_enable = true
    Bullet.counter_cache_enable        = true
    Bullet.bullet_logger = true
  end

  config.cache_classes = true
  config.eager_load = false
  config.consider_all_requests_local = true
end
