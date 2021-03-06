# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Rails.application.config.assets.precompile += %w( styles/devise.scss )
# Rails.application.config.assets.precompile += %w( dashboard.css )
# Rails.application.config.assets.precompile += %w( reports.css )
# Rails.application.config.assets.precompile += %w( styles/features_boxed.scss )
# Rails.application.config.assets.precompile += %w( styles/welcome.scss )
# Rails.application.config.assets.precompile += %w( styles/dashboard.css )
# Rails.application.config.assets.precompile += %w( fuse/*.js )
# Rails.application.config.assets.precompile += %w( fuse/*.css )
# Rails.application.config.assets.precompile += %w( js/main.js )
#
# Rails.application.config.assets.precompile += %w( dashboard/dashboard.js )
# Rails.application.config.assets.precompile += %w()
# Rails.application.config.assets.precompile += %w( assets/fuse/*.css )
# Rails.application.config.assets.precompile += %w( assets/fuse/*.js )
# Rails.application.config.assets.precompile += %w( assets/fuse/*.scss )
# Rails.application.config.assets.precompile += %w( assets/fuse/*.png )
# Rails.application.config.assets.precompile += %w( assets/fuse/*.jpg )
# Rails.application.config.assets.precompile += %w( styles/fuse/_scss/*.scss )