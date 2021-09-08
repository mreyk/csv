defmodule CSV.Mixfile do
  use Mix.Project

  def project do
    [
      app: :csv,
      version: "2.4.1",
      elixir: "~> 1.12",
      deps: deps(),
      package: package(),
      docs: &docs/0,
      name: "CSV",
      consolidate_protocols: true,
      source_url: "https://github.com/beatrichartz/csv",
      description: "CSV Decoding and Encoding for Elixir",
      elixirc_paths: elixirc_paths(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test]
    ]
  end

  defp elixirc_paths do
    if Mix.env() == :test do
      ["lib", "test/support"]
    else
      ["lib"]
    end
  end

  def application do
    [applications: [:parallel_stream]]
  end

  defp package do
    [
      maintainers: ["Beat Richartz"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/beatrichartz/csv"}
    ]
  end

  defp deps do
    [
      {:parallel_stream, github: "mreyk/parallel_stream", branch: "fix_master"},
      {:excoveralls, "~> 0.14.2", only: :test},
      {:benchfella, "~> 0.3.5", only: :bench},
      {:ex_csv, "~> 0.1.5", only: :bench},
      {:csvlixir, "~> 2.0.4", only: :bench},
      {:cesso, "~> 0.1.3", only: :bench},
      {:ex_doc, "~> 0.25.2", only: :docs},
      {:inch_ex, "~> 2.0.0", only: :docs},
      {:earmark, "~> 1.4.15", only: :docs}
    ]
  end

  defp docs do
    {ref, 0} = System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])

    [
      source_ref: ref,
      main: "CSV"
    ]
  end
end
