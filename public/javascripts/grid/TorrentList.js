Ext.namespace('TH.grid');

TH.grid.TorrentList = Ext.extend(Ext.grid.GridPanel, {
  store: new Ext.data.Store({
		restful: true,
		proxy: new Ext.data.HttpProxy({
		  url: 'torrents'
		}),
		reader: new Ext.data.JsonReader(),
		autoLoad: true
  }),
	
  loadMask: {
	  store: this.store,
	  msg: "Loading..."
  },	
	
	autoExpandColumn: "0",
	
  columns: [
		{ header: 'Name',       dataIndex: 'name'},
		{ header: 'Down Speed', dataIndex: 'rate_download' },
		{ header: 'Up Speed',   dataIndex: 'rate_upload'},
		{ header: 'Status',     dataIndex: 'status' }
  ],
	
	viewConfig: {
	  autoFill: true,
	  forceFit: true
	},
	
  autoScroll: true
});