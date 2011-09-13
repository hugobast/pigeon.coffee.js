# ==========================================================================
# Project:   Pigeon.imagesController
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.imagesController = SC.ArrayController.create(
  SC.CollectionViewDelegate,

  allowsMultipleSelection: NO
  contentBinding: SC.Binding.multiple('Pigeon.currentPostController.images')
  
  addImage: ->
    @addObject { name: "New Image" }
    Pigeon.store.commitRecords()
  
)