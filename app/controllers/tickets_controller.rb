class TicketsController < ApplicationController
  before_action :authenticate_user!
end
