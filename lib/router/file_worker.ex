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

  def identify() do
    GenServer.call(__MODULE__, {:identify, "Archivo"})
  end

  def handle_call({:identify, file}, _from, state) do
    response = "El archivo que debemos identificar es el siguiente: #{file}"
    {:reply, response, state}
  end

end