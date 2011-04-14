# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections.clear

# Agregamos las reglas de inflección
ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural /([aeiou])([A-Z]|_|$)/, '\1s\2'
  inflect.plural /([rlnd])([A-Z]|_|$)/, '\1es\2'
  inflect.singular /([aeiou])s([A-Z]|_|$)/, '\1\2'
  inflect.singular /([rlnd])es([A-Z]|_|$)/, '\1\2'
  inflect.irregular "post","posts"
  inflect.irregular "user","users"
end
