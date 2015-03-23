defmodule Router.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok,name: __MODULE__ )
  end


  def init(:ok) do
   
    pool_options = [
      name: {:local, :router},
      worker_module: Router.File,
      size: 5,
      max_overflow: 10
    ]

    children = [
      :poolboy.child_spec(:router, pool_options, [])
    ]

    supervise(children, strategy: :one_for_one)

  end

end