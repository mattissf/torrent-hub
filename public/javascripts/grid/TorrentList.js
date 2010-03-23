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
		{ header: 'Name' },
		{ header: 'File' },
		{ header: 'ID' },
		{ header: 'Down Speed' },
		{ header: 'Status' }
  ],
	
	viewConfig: {
	  autoFill: true,
	  forceFit: true
	},
	
  autoScroll: true
});