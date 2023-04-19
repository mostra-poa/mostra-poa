# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MostraPoa.Repo.insert!(%MostraPoa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MostraPoa.{Repo, Blog.Post}

Repo.insert!(%Post{
  title: "Hello world",
  body: "This is my first post",
  visible: true
})

Repo.insert!(%Post{
  title: "Hello world",
  body: "This is my second post",
  visible: true
})

Repo.insert!(%Post{
  title: "Hello world",
  body: "This is my third post",
  visible: true
})

Repo.insert!(%Post{
  title: "Hello world",
  body: "This is my first invisble post",
  visible: false
})

Repo.insert!(%MostraPoa.Sessions.Session{
  name: "Why Use Elixir",
  location: "Building B",
  start: ~N[2023-04-19 23:29:59] ,
  visible: false
})

Repo.insert!(%MostraPoa.Sessions.Session{
  name: "Hello world",
  location: "Building A",
  start: ~N[2023-04-19 15:29:59] ,
  visible: true
})

Repo.insert!(%MostraPoa.Sessions.Session{
  name: "Bah",
  location: "Building B",
  start: ~N[2023-04-19 12:29:59] ,
  end: ~N[2023-04-19 16:29:59] ,
  visible: true
})

Repo.insert!(%MostraPoa.Sessions.Session{
  name: "Xabla",
  location: "Building C",
  start: ~N[2023-04-18 12:29:59] ,
  end: ~N[2023-04-18 16:29:59] ,
  visible: true
})
