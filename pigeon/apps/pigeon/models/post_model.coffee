# ==========================================================================
# Project:   Pigeon.Post
# Copyright: @2011 Hugo Bastien
# ==========================================================================

Pigeon.Image = SC.Record.extend
  primaryKey: '_id'
  name: SC.Record.attr(String)

Pigeon.Post = SC.Record.extend
  nestedRecordNamespace: Pigeon

  primaryKey: '_id'
  title: SC.Record.attr(String)
  date: SC.Record.attr(String)
  tags: SC.Record.attr(String)
  price: SC.Record.attr(Number)
  description: SC.Record.attr(String)
  images: SC.Record.toMany('Pigeon.Image', { nested: YES })
