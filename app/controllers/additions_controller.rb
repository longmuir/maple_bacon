class AdditionsController < ApplicationController
  autocomplete :ingredient, :name, full: true
end