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

Repo.insert! %Post{
  title: "Hello world",
  body: "This is my first post",
  visible: true
}

Repo.insert! %Post{
  title: "Hello world",
  body: "This is my second post",
  visible: true
}

Repo.insert! %Post{
  title: "Hello world",
  body: "This is my third post",
  visible: true
}

Repo.insert! %Post{
  title: "Hello world",
  body: "This is my first invisble post",
  visible: false
}
