class PinsController < ApplicationController
# Add a before_filter to any controller that you want to secure.
# This will force user's to login before they can see the actions in this controller
before_filter :authorize

end