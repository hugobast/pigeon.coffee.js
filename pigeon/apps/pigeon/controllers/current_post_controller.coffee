# ==========================================================================
# Project:   Pigeon.currentPostController
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.currentPostController = SC.ObjectController.create
  contentBinding: SC.Binding.single('Pigeon.postsController.selection')

  savePost: ->
    Pigeon.store.commitRecord Pigeon.Post, @get('id'), @get('storeKey')


