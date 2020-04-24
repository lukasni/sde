defmodule SDE.Downloader do
  @sde_url "https://eve-static-data-export.s3-eu-west-1.amazonaws.com/tranquility/sde.zip"
  @hash_url "https://eve-static-data-export.s3-eu-west-1.amazonaws.com/tranquility/checksum"

  @sde_path :code.priv_dir(:sde)
  @hash_path :code.priv_dir(:sde) |> Path.join("checksum")

  def update() do
    with {:updated, hash} <- check_update(),
         {:ok, _} <- download_sde(),
         :ok <- store_hash(hash) do
      {:updated, hash}
    end
  end

  def get_current_hash() do
    {:ok, {{_, 200, 'OK'}, _headers, hash}} =
      :httpc.request(:get, {to_charlist(@hash_url), []}, [], body_format: :binary)

    hash
  end

  def get_stored_hash() do
    case File.read(@hash_path) do
      {:ok, hash} -> hash
      {:error, _} -> nil
    end
  end

  def store_hash(hash) do
    File.write(@hash_path, hash)
  end

  def check_update() do
    stored_hash = get_stored_hash()
    current_hash = get_current_hash()

    if stored_hash == current_hash do
      {:current, stored_hash}
    else
      IO.puts("Updated SDE available.")
      {:updated, current_hash}
    end
  end

  def update_available?() do
    get_current_hash() != get_stored_hash()
  end

  def download_sde() do
    IO.puts("Downloading new SDE...")
    {:ok, {{_, 200, 'OK'}, _headers, body}} =
      :httpc.request(:get, {to_charlist(@sde_url), []}, [], body_format: :binary)

    body
    |> :zip.unzip(cwd: @sde_path)
  end
end
