import Config
import Dotenvy

env_dir_prefix = IO.inspect (System.get_env("RELEASE_ROOT") || Path.expand("./envs"))

source!([
  Path.absname(".env", env_dir_prefix),
  Path.absname(".#{config_env()}.env", env_dir_prefix),
])

config :mus, Mus.Repo,
  database: env!("DB_NAME", :string),
  username: env!("DB_USER", :string),
  password: env!("DB_PASSWORD", :string),
  hostname: env!("DB_HOSTNAME", :string)
