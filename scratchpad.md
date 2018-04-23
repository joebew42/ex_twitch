# ExTwitch

A client implementation for the new Twitch API

## DOING

## TODO

- implement the [`/games/top`](https://dev.twitch.tv/docs/api/reference/#get-top-games)
- handle the token Expiration in the `TokenManager` and renew it
  - read about [timeouts and genserver](https://elixirforum.com/t/how-to-stop-gen-server-by-timeout/1742)
  - or think about delegating another process (e.g. `TokenRenewalProcess`) that will notify the `TokenManager` to renew the token
- extract the client outside the `TokenManager`
- [?] what is `formatter.exs`

## DONE

- think about move the `API` module out from the `ExTwitch` top level module
- add the `TokenManager` as collaborator of the `ExTwitch` client
- introduce a `TokenManager` that will be responsible to get the oauth token that is then used by the client
- write a first `README.md` for the project
- implement the [users](https://dev.twitch.tv/docs/api/reference/#get-users) API
- `/users` handle both `login` and `id` fields
- `/users` handle more than one `field` id
- `/users` handle the `id` field
- `/users` handle more than one `login` field
- how to make http request with Elixir (are there good http libraries)
- how to deal with the authentication, tokens, etc ...
- take a look at the documentation of the [new Twitch API](https://dev.twitch.tv/docs/api/)
  - to understand from which API feature we could start
- create an empty mix project and commit
- create a github repository

