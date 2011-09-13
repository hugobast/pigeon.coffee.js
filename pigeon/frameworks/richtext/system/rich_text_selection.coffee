# ==========================================================================
# Project:  RichText 
# Copyright: @2011 Hugo Bastien
# ==========================================================================

RichText.RichTextSelection = SC.Object.extend
  
  editor: null
  
  text: ( ->
    @getPat 'editor.selectionText'
  ).property()

  element: ( ->
    @getPath 'editor.selectionElement'
  ).property()

  concatenatedProperties: ['updateProperties']

  updateProperties: ['isBold', 'isUnderlined', 'isItalicized',
                     'isStrikethrough', 'isLeftAligned', 'isJustified', 
                     'isCentered', 'isRightAligned', 'fontSize', 'isSubscript', 
                     'isSubscript', 'isOrderedList', 'isUnorderedList']

  length: ( ->
    text = @get 'text'
    if text then text.length else 0
  ).property('text').cacheable()

  fontSize: ( (key, val) ->
    editor = @get 'editor'
    if editor and editor.get 'editorIsReady'
      if val isnt undefined
        @propertyWillChange 'fontSize'
        ret = editor.iframeExecCommand 'fontSize', false, val
        @propertyDidChange 'fontSize'
      if ret then editor.changedSelection()
    fontSize = @getStyle('font-size')
    fontSize and RichText.HtmlSanitizer.standardizeFontSize fontSize
  ).property().cacheable()
