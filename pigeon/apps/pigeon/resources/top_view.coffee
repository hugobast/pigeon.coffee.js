# ==========================================================================
# Project:   Pigeon - topView
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.topView = SC.ToolbarView.design
  layout: { top: 0, left: 0, right: 0, height: 36 }
  anchorLocation: SC.ANCHOR_TOP
  childViews: ['labelView']
      
  labelView: SC.LabelView.design
    layout: { centerY: 0, height: 24, left: 8, width: 200 }
    controlSize: SC.LARGE_CONTROL_SIZE
    fontWeight: SC.BOLD_WEIGHT
    value: 'Pigeon Admin'
        

