# ==========================================================================
# Project:   Pigeon - middleView
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.middleView = SC.View.design
  layout: { top: 36, bottom: 32, left: 0, right: 0 }
  childViews: ['leftView', 'rightView']

  leftView: SC.ScrollView.design
    layout: { top: 0, bottom: 0, left: 0, width: 280 }

    contentView: SC.ListView.design
      contentBinding: 'Pigeon.postsController.arrangedObjects'
      selectionBinding: 'Pigeon.postsController.selection'
      canDeleteContent: YES
      contentValueKey: 'title'

  rightView: SC.ScrollView.design
    isVerticalScrollerVisible: YES
    layout: { left: 280 }
    
    contentView: SC.View.design
      useStaticLayout: YES
      layout: { height: 640, width: 640 }
      childViews: ['titleView', 'bodyView', 'picturesView']

      titleView: SC.TextFieldView.design
        layout: { top: 20, height: 30, left: 20, right: 300  }
        fontWeight: SC.BOLD_WEIGHT
        valueBinding: 'Pigeon.currentPostController.title'

      bodyView: SC.TextFieldView.design
        isTextArea: YES
        layout: { top: 60, height: 200, left: 20, right: 20 }
        valueBinding: 'Pigeon.currentPostController.description'

      picturesView: SC.UploadView.design
        layout: { top: 280, left: 20, right: 20, height: 300 }