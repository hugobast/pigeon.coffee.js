# ==========================================================================
# Project:   Pigeon - bottomView
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.bottomView = SC.ToolbarView.design
  layout: { bottom: 0, left: 0, right: 0, height: 32 }
  anchorLocation: SC.ANCHOR_BOTTOM
  childViews: ['saveButton', 'addButton', 'removeButton']

  addButton: SC.ButtonView.design
    layout: { centerY: 0, height: 24, left: 12, width: 24 }
    title: "+"
    target: "Pigeon.postsController"
    action: "addPost"
    
  removeButton: SC.ButtonView.design
    layout: { centerY: 0, height: 24, left: 36, width: 24 }
    title: "-"
    target: "Pigeon.postsController"
    action: "removePost"

  saveButton: SC.ButtonView.design
    layout: { centerY: 0, height: 24, right: 12, width: 100 }
    title: "Save"
    target: "Pigeon.currentPostController"
    action: "savePost"