/**
 * Description:
 * 
 * 	You show this popupwindow when user cannot connect for some reason to the socket server.
 * 
 * Resources:
 * 	
 * 	[text] no_connection.title=No connection
 *  [text] no_connection.description=We are sorry, but their is no connection to the lobby.
 * 
 * 	
 * @author jamalsoueidan
 * 18. sep 2011
 */	

package com.soueidan.games.engine.components.popups
{
	import com.soueidan.games.engine.components.Text;
	import com.soueidan.games.engine.managers.ResourceManager;
	
	public class NoConnectionPopUpWindow extends PopUpWindow
	{
		private var _text:Text;
		
		public function NoConnectionPopUpWindow() {
			super();
			
			title = ResourceManager.getString("no_connection.title");
			
			width = 400;
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if (!_text ) {
				_text = new Text();
				_text.percentWidth = 100;
				_text.text = ResourceManager.getString("no_connection.description");
				addElement(_text);
			}
			
			closeButton.visible = false;
		}
	}
}