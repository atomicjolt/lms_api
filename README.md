= Canvas

This project describes a wrapper around the Canvas REST API.


== Installation

To install, add `canvas` to your Gemfile:

```ruby
    gem "canvas"
```


== Configuration

Your app must tell the gem which model is used to represent the
authentication state. For instance, if you're using ActiveRecord, you
might have an `Authentication` model, which encapsulates a temporary
API token.

```ruby
class Authentication < ActiveRecord::Base
  # token: string
end
```

Then, you tell the gem about this model:

```ruby
Canvas::API.auth_state_model = Authentication
```

This allows the gem to transparently refresh the token when the token
expires, and do so in a way that respects multiple processes all trying
to do so in parallel.


== Usage

To use the API wrapper, instantiate a `Canvas::API` instance with the
url of the Canvas instance you want to communicate with, as well as the
current authentication object, and (optionally) a hash of options to use
when refreshing the API token.

```ruby
auth = Authentication.first # or however you are storing global auth state
api = Canvas::API.new("http://your.canvas.instance", auth, 
        client_id: "...",
        client_secret: "..."
        redirect_uri: "..."
        refresh_token: "...")
```

You can get the URL for a given Canvas interface via the `::canvas_url`
class method:

```ruby
params = {
  id: id,
  course_id: course_id,
  controller: "foo",
  account_id: 1,
  all_dates: true,
  other_param: "foobar"}

url = Canvas::API.canvas_url("GET_SINGLE_ASSIGNMENT", params)
```

Once you have the URL, you can send the request by using `api_*_request`
methods:

* `api_get_request(url, headers={})`
* `api_post_request(url, payload, headers={})`
* `api_delete_request(url, headers={})`
* `api_get_all_request(url, headers={})`
* `api_get_blocks_request(url, headers={}, &block)`

The last two are convenience methods for fetching multiple pages of data.
The `api_get_all_request` method returns all rows in a single array. The
`api_get_blocks_request` method yields each "chunk" of data to the block.
