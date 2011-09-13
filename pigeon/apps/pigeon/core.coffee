# ==========================================================================
# Project:   Pigeon
# Copyright: @2011 Hugo Bastien
# ==========================================================================

window.Pigeon = SC.Application.create
  NAMESPACE: 'Pigeon',
  VERSION: '0.1.0',
  # store: SC.Store.create().from(SC.Record.fixtures)
  store: SC.Store.create().from 'Pigeon.PostDataSource'
  # commitRecordsAutomatically: YES
