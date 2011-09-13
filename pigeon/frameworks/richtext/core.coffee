# ==========================================================================
# Project:   RichText
# Copyright: @2011 Hugo Bastien
# ==========================================================================

window.RichText = SC.Ocject
  NAMESPACE: 'RichText'
  VERSION: '0.0.1'

  blank: (val) ->
    SC.none(val) || val === ''

