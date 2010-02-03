Ext.namespace('TH.grid.TorrentList');

TH.grid.TorrentList = function(config) {
  var proxy = new Ext.data.HttpProxy({
    url: 'torrents'
  });

  var store = new Ext.data.Store({
    restful: true,
    proxy: proxy,
    reader: new Ext.data.JsonReader(),
    autoLoad: true
  });

  var config = Ext.apply({
    loadMask: {
      store: store,
      msg: "Loading..."
    },
    store: store,
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
  }, config);

  TH.grid.TorrentList.superclass.constructor.call(this, config);
};

Ext.extend(TH.grid.TorrentList, Ext.grid.GridPanel, {
});
