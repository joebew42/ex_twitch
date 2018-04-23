# ExTwitch

ExTwitch is a [**early**](scratchpad.md) stage development of an Elixir client implementation for the [new Twitch API](https://dev.twitch.tv/docs/api/)

## Setup

Create a [Twitch app](https://dev.twitch.tv/dashboard/apps/create), and then export the `clientId` and the `secret` as environment variables:

```
export TWITCH_CLIENT_ID=<YOUR_CLIENT_ID>
export TWITCH_SECRET=<YOUR_SECRET>
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
