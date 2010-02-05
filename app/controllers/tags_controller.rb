class TagsController < ApplicationController
  autocomplete_for :tag, :name
end