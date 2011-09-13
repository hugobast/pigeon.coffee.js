# ==========================================================================
# Project:   Pigeon.PostDataSource
# Copyright: @2011 Hugo Bastien
# ==========================================================================

sc_require('models/post_model')

Pigeon.POSTS_QUERY = SC.Query.local Pigeon.Post, 
  orderBy: 'title'

Pigeon.PostDataSource = SC.DataSource.extend(
  
  fetch: (store, query) ->
    if query == Pigeon.POSTS_QUERY
      SC.Request.getUrl('/posts').header
        'Accept': 'application/json' 
      .json().notify(@, 'didFetchPosts', store, query).send()
      YES
    NO
    
  didFetchPosts: (response, store, query) ->
    if SC.ok(response)
      store.loadRecords Pigeon.Post, response.get('body').content
      store.dataSourceDidFetchQuery query
      #storeKeys = store.loadRecords(Pigeon.Post, response.body().content)
      #store.loadQueryResults(query, storeKeys)
    else
      store.dataSourceDidErrorQuery(query, response)
      
  retriveRecord: (store, storeKey) ->
    if SC.kindOf(store.recordTypeFor(storeKey), Pigeon.Post)
      url = store.idFor(storeKey)
      SC.Resquest.getUrl(url).header
        'Accept': 'application/json'
      .json().notify(@, 'didRetrievePort', store, query).send()
      YES
    else
      NO
  
  didRetrievePost: (reponse, store, storeKey) ->
    if SC.ok(response)
      dataHash = response.get('body').content
      store.dataSourceDidComplete(storeKey, dataHash)
    else
      store.dataSourceDidError(storeKey, response)

  createRecord: (store, storeKey) ->
    self = @
    if SC.kindOf(store.recordTypeFor(storeKey), Pigeon.Post)
      post = store.readDataHash(storeKey)

      # Using jQuery
      response = SC.$.ajax
        type: 'POST'
        url: '/posts'
        data: { post: post }
        dataType: 'json'
        success: (data, status, xhr) ->
          SC.run ->
            response = SC.Response.create
              request: null
              body: data
              status: status
            self.didCreatePost(response, store, storeKey)
      
      # Using Sproutcore (gives me trouble)
      #SC.Request.postUrl('/posts').header
      #  'Accept': 'application/json'
      #.json().notify(@, 'didCreatePost', store, storeKey)
      #.send(newPost)
      YES
    else
      NO

  didCreatePost: (response, store, storeKey) ->
    if SC.ok(response)
      id = response.body.post._id
      store.dataSourceDidComplete storeKey, null, id
    else
      store.dataSourceDidError(storeKey, response)

  updateRecord: (store, storeKey) ->
    self = @
    if SC.kindOf(store.recordTypeFor(storeKey), Pigeon.Post)
      post = store.readDataHash(storeKey)
      response = SC.$.ajax
        type: 'PUT'
        url: '/posts/' + post._id
        data: { post: JSON.stringify(post) }
        dataType: 'json'
        success: (data, status, xhr) ->
          SC.run ->
            response = SC.Response.create
              request: null
              body: data
              status: status
            self.didUpdatePost(response, store, storeKey)
      YES
    else
      NO
  
  didUpdatePost: (response, store, storeKey) ->
    if SC.ok(response)
      data = response.body
      if data then data = data.content
      store.dataSourceDidComplete(storeKey, data)
    else
      store.dataSourceDidError(storeKey)

  destroyRecord: (store, storeKey) ->
    self = @
    if SC.kindOf(store.recordTypeFor(storeKey), Pigeon.Post)
      post_id = store.idFor(storeKey)
      response = SC.$.ajax
        type: 'DELETE'
        url: '/posts/' + post_id
        data: null
        success: (data, status, xhr) ->
          SC.run ->
            response = SC.Response.create
              request: null
              body: data
              status: status
            self.didDestroyPost(response, store, storeKey)
      YES
    else
      NO

  didDestroyPost: (response, store, storeKey) ->
    if SC.ok(response)
      store.dataSourceDidDestroy(storeKey)
    else
      store.dataSourceDidError(response)
)
