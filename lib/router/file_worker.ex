defmodule Router.File do
  use GenServer
	
	@doc """
  Starts file worker.
  """
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, [])
  end

  def init(state) do
    {:ok, state}
  end

  def identify(file) do
  	worker = :poolboy.checkout(:router)
		file_type = GenServer.call(worker, {:identify, file})
		:poolboy.checkin(:router, worker)
		file_type
  end

  def handle_call({:identify, file}, _from, state) do
    case file do
      "Declaration" -> 
        {:reply, {:type, "Tax Declaration"}, state}
      _ -> 
        {:reply, {:type, "Not suportted"}, state}  
    end
  end

end