defmodule Router.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok,name: __MODULE__ )
  end


  def init(:ok) do
    IO.puts "Inciando"
    # Here are my pool options
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

    # children = [
    #   worker(Router.File,[]),
    #   #worker(GenEvent, [[name: @manager_name]]),
    #   #worker(KV.Registry, [@manager_name, [name: @registry_name]])
    # ]

    # supervise(children, strategy: :one_for_one)
  end

end