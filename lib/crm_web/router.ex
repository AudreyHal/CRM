defmodule CrmWeb.Router do
  use CrmWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CrmWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/accounts", AccountController
    resources "/leads", LeadController
    resources "/opportunities", OpportunityController
    resources "/contacts", ContactController
    post "/addnote/:id", AccountController, :addnote
    post "/addleadnote/:id", LeadController, :addnote
    post "/addcontactnote/:id", ContactController, :addnote
    post "/addopportunitynote/:id", OpportunityController, :addnote
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrmWeb do
  #   pipe_through :api
  # end
end
