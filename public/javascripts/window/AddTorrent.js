Ext.namespace('TH.window');

TH.window.AddTorrent = Ext.extend(Ext.Window, {
	title: "Add a torrent",
	layout: 'fit',
  width:  400,
	height: 100,
	
	initComponent: function() {
		this.items = [
	    new Ext.FormPanel({
				frame: true,
				id: 'panel_add_torrent',
	      fileUpload: true,
	      url: 'torrents',
	      method: 'post',
	      items: [
          new Ext.ux.form.FileUploadField({
						id: 'upload_torrent',
            emptyText: 'Select a torrent',
            fieldLabel: 'Torrent',
            name: 'torrent_file',
            buttonText: 'Browse'
					})
				],
	      buttons: [{
	        text: 'Ok',
	        handler: function() {
	          Ext.getCmp('panel_add_torrent').getForm().submit();
	        }
	      }]
	    })
	  ];
		
		TH.window.AddTorrent.superclass.initComponent.apply(this, arguments);
	}
});