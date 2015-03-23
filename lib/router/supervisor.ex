defmodule Router.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok,name: __MODULE__ )
  end


  def init(:ok) do
   
    children = []
    supervise(children, strategy: :one_for_one)

  end

  def identify(worker,file) do
    GenServer.call(worker, {:identify, file})
  end

end