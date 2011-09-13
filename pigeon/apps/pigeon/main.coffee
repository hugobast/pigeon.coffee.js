# ==========================================================================
# Project:   Pigeon
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.main = ->
  Pigeon.getPath('mainPage.mainPane').append()

window.main = -> Pigeon.main()

# posts = Pigeon.store.find(Pigeon.Post)
# Pigeon.postsController.set('content', posts)

posts = Pigeon.store.find(Pigeon.POSTS_QUERY)
Pigeon.postsController.set('content', posts)
