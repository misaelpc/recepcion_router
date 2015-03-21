defmodule Router do
	use Application
	require Logger

  def start(_type, _args) do
    Logger.info "Start app" 
    Router.Supervisor.start_link
  end
end
