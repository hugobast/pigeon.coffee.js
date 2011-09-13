# ==========================================================================
# Project:   Pigeon - mainPage
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.mainPage = SC.Page.design
  mainPane: SC.MainPane.design
    childViews: ['middleView', 'topView', 'bottomView']
    
    topView: Pigeon.topView
    middleView: Pigeon.middleView
    bottomView: Pigeon.bottomView

