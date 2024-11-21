source "https://rubygems.org"

ruby "3.3.5"

# Rails core
gem "rails", "~> 7.1.5"
gem "pg", "~> 1.1" # PostgreSQL
gem "puma", ">= 5.0" # Serveur web
gem "sprockets-rails" # Asset pipeline

# Gems principales
gem "devise" # Authentification
gem "importmap-rails" # Gestion JS avec Importmap
gem "turbo-rails" # Turbo pour navigation SPA-like
gem "stimulus-rails" # Framework JS
gem "jbuilder" # Génération JSON pour API

# UI et front-end
gem "bootstrap", "~> 5.2"
gem "autoprefixer-rails" # Prefixes CSS auto
gem "font-awesome-sass", "~> 6.1" # Icônes
gem "simple_form", github: "heartcombo/simple_form" # Formulaires
gem "sassc-rails" # Compilation SCSS

# Stockage Cloud
gem "cloudinary"

# Windows spécifique
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Optimisation du démarrage
gem "bootsnap", require: false

# Environnements spécifiques
group :development, :test do
  gem "dotenv-rails" # Gestion des variables d'environnement
  gem "debug", platforms: %i[ mri windows ] # Outil de debug
end

group :development do
  gem "web-console" # Console Rails dans le navigateur
end

group :test do
  gem "capybara" # Test des vues
  gem "selenium-webdriver" # Driver Selenium
end
