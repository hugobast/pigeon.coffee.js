# ==========================================================================
# Project:   Pigeon.postsController
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.postsController = SC.ArrayController.create(
  SC.CollectionViewDelegate,

  allowsMultipleSelection: NO
  
  summary: ( ->
    len = @get('length')
    if len && len > 0
      ret = if len == 1 then "1 post" else "%@ posts".fmt(len)
    else ret = "No posts" 
    ret ).property('length').cacheable()
  
  collectionViewDeleteContent: (view, content, indexes) ->
    records = indexes.map (idx) ->
      @objectAt idx
    , @
    records.invoke('destroy')
    Pigeon.store.commitRecords()
    selected_index = indexes.get('min') - 1
    selected_index = 0 if selected_index < 0
    @selectObject(@objectAt(selected_index))
    
    
  removePost: ->
    @selection().invoke('destroy')
    Pigeon.store.commitRecords()

  addPost: ->
    post = Pigeon.store.createRecord(Pigeon.Post,
      "description": ""
      "title": "New Post"
    )
    Pigeon.store.commitRecords()

    @selectObject(post)

    @invokeLater( ->
      contentIndex = @indexOf(post)
      list = Pigeon.mainPage.getPath('mainPane.middleView.leftView.contentView')
      listItem = list.itemViewForContentIndex(contentIndex)
      listItem.beginEditing()
    )
    YES
)
