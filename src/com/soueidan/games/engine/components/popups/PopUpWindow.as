package com.soueidan.games.engine.components.popups
{
	import com.soueidan.games.engine.core.EngineApplication;
	import com.soueidan.games.engine.managers.EngineApplicationManager;
	import com.soueidan.games.engine.managers.ResourceManager;
	import com.soueidan.games.engine.skins.TitleWindowSkin;
	
	import flash.events.MouseEvent;
	
	import mx.managers.PopUpManager;
	
	import spark.components.Label;
	import spark.components.TitleWindow;
	import spark.layouts.VerticalLayout;
	
	public class PopUpWindow extends TitleWindow
	{
		protected var _visible:Boolean = false;
		protected var _modal:Boolean = true;
		
		public function set modal(value:Boolean):void {
			_modal = value;
		}
		
		public function PopUpWindow()
		{
			super();
			
			var verticalLayout:VerticalLayout = new VerticalLayout();
			verticalLayout.paddingBottom = verticalLayout.paddingLeft = verticalLayout.paddingRight = verticalLayout.paddingTop = 10;
			verticalLayout.horizontalAlign = "center";
			
			layout = verticalLayout;
			
			setStyle("skinClass", Class(TitleWindowSkin));
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if ( titleDisplay ) {
				(titleDisplay as Label).setStyle("textAlign", ResourceManager.getString("left"));
			}
		}
		
		override protected function closeButton_clickHandler(event:MouseEvent):void {
			hide();
		}
		
		public function show():void {
			var app:EngineApplication = EngineApplicationManager.getInstance();
			_visible = true;
			x = -1000;
			app.addElement(this);
			app.removeElement(this);
			_visible = false;
			invalidateDisplayList();
			
			PopUpManager.addPopUp(this, app, _modal);
		}
		
		public function hide():void {
			PopUpManager.removePopUp(this);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			
			if ( !_visible ) {
				x = EngineApplicationManager.getInstance().width/2 - getExplicitOrMeasuredWidth()/2;
				y = EngineApplicationManager.getInstance().height/2 - getExplicitOrMeasuredHeight()/2;
				
				_visible = true;
			}
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
		}
	}
}