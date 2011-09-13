# ==========================================================================
# Project:   Upload
# Copyright: @2011 Hugo Bastien
# ==========================================================================

sc_require 'scripts/plupload'

SC.UploadView = SC.View.extend(
  # mixins,
  classNames: ['sc-upload-view']
  layerId: 'upload'
  runtimes: 'html5'
  url: '/images'
  maxFileSize: '10mb'
  chunkSize: '1mb'
  postId: ''
  uploader: null
  
  childViews: ['topView', 'bottomView', 'middleView']
  
  topView: SC.ToolbarView.design
    layout: { top: 20, left: 0, right: 0, height: 24 }
    childViews: ['labelView']

    labelView: SC.LabelView.design
      layout: { centerY: 0, height: 18, left: 8, width: 200 }
      fontWeight: SC.BOLD_WEIGHT
      value: 'Images'
    
  middleView: SC.ScrollView.design
    layout: { top: 44, bottom: 30, right: 0, left: 0 }
    contentView: SC.ListView.design
      layout: { top: 0, bottom: 0, left: 0, right: 0 }
      contentBinding: 'Pigeon.imagesController.arrangedObjects'
      selectionBinding: 'Pigeon.imagesController.selection'
      canDeleteContent: YES
      contentValueKey: 'name'

  bottomView: SC.ToolbarView.design
    layout: { bottom: 0, left: 0, right: 0, height: 32 }
    anchorLocation: SC.ANCHOR_BOTTOM
    childViews: ['addButton', 'startButton']

    addButton: SC.ButtonView.design
      layout: { top: 3, height: 24, left: 12, width: 100 }
      title: "Add Image"
  
    startButton: SC.ButtonView.design
      layout: { top: 3, height: 24, left: 124, width: 100 }
      title: "Save"

  didCreateLayer: ->
    @invokeLater ->
      @uploader = new plupload.Uploader
        runtimes: @runtimes
        url: @url
        browse_button : 'addImages'
        container: 'upload'
        max_file_size: @maxFileSize
        unique_names : true
      @uploader.init()

  render: (context) ->
    context.push('<a id="addImages">Add Images</a>')

)

# SC.UploadView = SC.View.extend(
# {
#   classNames: 'sc-upload-view'.w(),
#   
#   layerId: 'upload',
# 
#   runtimes: 'html5',
#   
#   url: '/images',
#   
#   maxFileSize: '10mb',
#   
#   chunkSize: '1mb',
#   
#   postId: '',
#  
#   init
# 
#   didCreateLayer: function() {
#     this.invokeLater(function() {
#       $('.sc-upload-view').pluploadQueue({
#         runtimes: this.get('runtimes'),
#         url: this.get('url'),
#         max_file_size: this.get('maxFileSize'),
#         chunk_size: this.get('chunkSize'),
#         unique_names : true,
#         multipart : true
#       });
#     });
#   }
# });
