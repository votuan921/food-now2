Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif js/*.js skins/*/*.css ion.rangeSlider.css ion.rangeSlider.skinFlat.css slider-pro.min.css)
Rails.application.config.assets.precompile += %w( application2.css )
