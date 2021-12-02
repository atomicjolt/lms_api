#1.23.0
Updated Canvas API definitions
Support for graphql 1.13

#1.14.0
Updated Canvas API definitions

#1.13.0
Updated Canvas API definitions

#1.12.1
Changes error that is thrown when a token refresh fails to make it easier to tell whether it was Canvas saying
the token was invalidated or if Canvas was unavailable.

#1.6.0
Updated Canvas API definitions

#1.5.0
Move GraphQL into a new gem

#1.4.1
Use ID instead of String where appropriate in GraphQL objects.

#1.4.0
Adds GraphQL support for querying Canvas API. This is still WIP and not all resolvers return the propery type.
Basic mutations are also available, but not all mutations are working properly. Use at your own risk.

#1.3.10
Adds addition success status codes

# 1.3.6
Updates API calls to Canvas to match as of 8/8/2017

# 1.3.4
Adds "force_refresh" to Canvas API to allow for immediate refreshing of the access token.
