
  

# Essential Feed App - Image Feed Feature
[![Build Status](https://app.travis-ci.com/sebspi/essential-feed-case-study.svg?branch=main)](https://app.travis-ci.com/sebspi/essential-feed-case-study)
  

## BDD Specs

  

### Story: Customer request to see their image feed

  

### Narrative #1

> As an online customer I want the app to automatically load my latest image feed So I can always enjoy the newest images of my friends

#### Scenarios (Acceptance criteria)

  

Given the customer has connectivity

When the customer requests to see their feed

Then the app should display the latest feed from remote

And replace the cache with the new feed

### Narrative #2

> As an offline customer I want the app to show the latest saved version of my image feed So I can always enjoy images of my friends

#### Scenarios (Acceptance criteria)

  
```
Given the customer does not have connectivity
  And there is a cached version of the feed
  And the cache is less than 7 days old or more
 When the customer requests to see the feed
 Then the app should display the latest feed saved

Given the customer does not have connectivity
  And the cache is empty
 When the customers requests to see the feed
 Then the app should display an error message
```

## Use Cases

### Load Feed from Remote Use Case

#### Data:

- URL

  

#### Primary course (happy path):

1. Execute "Load Feed Items" command with above data

2. System downloads data from the URL.

3. System validates downlaoded data.

4. System creates feed items from valid data

5. System delivers feed items.

  

#### Invalid data - error course (sad path):

1. System invalid data delivers error.

  

#### No connectivity - error course (sad path):

1. System delivers connectivity error.


  

### Load Feed from Cache Use Case

#### Data:

- Max age (7 days)

  

#### Primary course:

1. Execute "Load Feed Items" command with above data.

2. System fetches feed data from cache.

3. System validates cache is less then seven days old.

4. System creates feed items from cached data.

5. System delivers feed items.

#### Error course (sad path):
1. System delivers error.

#### Expired cache course (sad path):

1. System deletes cache.
2. System delivers no feed items.

#### Empty cache course (sad path):

1. System delivers no feed items.

  

### Cache Feed Use Case

#### Data:
- Feed items

#### Primary course (happy path):
1. Execute "Save Feed Items" command with above data.
2. System deletes old cache data.
3. System encodes feed items.
4. System timestamps the new cache.
5. System saves new cache data.
6. System delivers success message.

#### Saving error course (sad path):
1. System delivers error

#### Deleting error course (sad path):
1. System delivers error

## Flowchart

![Flowchart](flowchart.png)

  

## Architecture

![Architecture](architecture.png)

  

## Model specs

|Property|Type |

|--|--|

| `id`|`UUID` |

| `description`|`String (optional)` |

| `location`|`String (optional)` |

| `imageURL`|`URL` |

  

## Payload contract

```GET /feed

200 RESPONSE

  

{

"items": [

{

"id": "a UUID",

"description": "a description",

"location": "a location",

"image": "https://a-image.url",

},

{

"id": "another UUID",

"description": "another description",

"image": "https://another-image.url"

},

{

"id": "even another UUID",

"location": "even another location",

"image": "https://even-another-image.url"

},

{

"id": "yet another UUID",

"image": "https://yet-another-image.url"

}

...

]

}

```
