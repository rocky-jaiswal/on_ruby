class HomeController < ApplicationController
  expose(:current_event) { Event.current.first }
  expose(:events) { Event.latest }
  expose(:people) { User.scoped }
  expose(:wishes) { Wish.latest }
  expose(:organizers) { User.organizer }
  expose(:locations) { Location.cometogether }
  expose(:companies) { Location.company }
end
