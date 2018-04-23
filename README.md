# ExTwitch

ExTwitch is a [**early**](scratchpad.md) stage development of an Elixir client implementation for the [new Twitch API](https://dev.twitch.tv/docs/api/)

## Setup

Obtain an `OAuth access token` and export it as environment variable

```
export TWITCH_OAUTH_TOKEN=<YOUR_TOKEN>
```

In order to obtain an access token a [Twitch app must be created](https://dev.twitch.tv/dashboard/apps/create), and with the `clientId` and `clientSecret` we have to create an access token by making a HTTP POST request:

```
curl -X POST "https://id.twitch.tv/oauth2/token?client_id=<CLIENT_ID>&client_secret=<CLIENT_SECRET>&grant_type=client_credentials"
```

## Example Usage

An example of querying the [`/users`](https://dev.twitch.tv/docs/api/reference/#get-users) endpoint

```
{:ok, users} = ExTwitch.API.users(login: ["joebew42"])
```

## Run the tests

```
mix deps.get
mix test
```
