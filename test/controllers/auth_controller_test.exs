defmodule Tudo.AuthControllerTest do
  use Tudo.ConnCase

  test "GET /auth/github/callback", %{conn: conn} do
    # transform conn to have conn.assigns have %{ueberauth_auth} property
    conn = put_in(conn.assigns, %{ueberauth_auth: %{}})
    conn = get conn, "/auth/github/callback"

    assert get_flash(conn, :info) =~ "sucessfully authenticated"

    # assert here
  end

  test "GET /auth/github/callback with errors", %{conn: conn} do
    conn = get conn, "/auth/github/callback"

    assert get_flash(conn, :info) =~ "error while authenticating"
  end

end
