defmodule MostraPoa.BlogTest do
  use MostraPoa.DataCase

  alias MostraPoa.Blog

  describe "posts" do
    alias MostraPoa.Blog.Post

    import MostraPoa.BlogFixtures

    @invalid_attrs %{body: nil, title: nil, visible: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{body: "some body", title: "some title", visible: true}

      assert {:ok, %Post{} = post} = Blog.create_post(valid_attrs)
      assert post.body == "some body"
      assert post.title == "some title"
      assert post.visible == true
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title", visible: false}

      assert {:ok, %Post{} = post} = Blog.update_post(post, update_attrs)
      assert post.body == "some updated body"
      assert post.title == "some updated title"
      assert post.visible == false
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)
      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end
end
