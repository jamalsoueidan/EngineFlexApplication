/**
 * Resources:
 *  [text] close=close
 * 
 * 
 * @author jamalsoueidan
 * 17. sep 2011
 */	
package com.soueidan.games.engine.components
{
	import com.soueidan.games.engine.components.popups.PopUpWindow;
	import com.soueidan.games.engine.core.EngineApplication;
	import com.soueidan.games.engine.managers.EngineApplicationManager;
	import com.soueidan.games.engine.managers.ResourceManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.events.FlexEvent;
	
	import spark.components.Button;

	public class Notification extends PopUpWindow
	{
		private var _message:String;
		private var _messageChanged:Boolean;
		
		private var _container:SkinnedVGroup;
		private var _text:Text;
		
		private var _autoClose:Button;
		
		private var _timer:Timer;
		private var _seconds:int;
		
		public function set seconds(value:int):void {
			_seconds = value;
		}
		
		public function Notification()
		{
			super();
			
			width = 400;
			title = ResourceManager.getString("notification");
			
			modal = false;
		}
		
		private function startCounting():void
		{
			if ( _timer ) 
				return;
			
			_timer = new Timer(1000, _seconds);
			_timer.addEventListener(TimerEvent.TIMER, timerCount, false, 0, true);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerComplete, false, 0, true);
			_timer.start();
		}
		
		protected function timerComplete(event:TimerEvent):void
		{	
			hide();
		}
		
		override public function hide():void {
			super.hide();
			
			if ( _timer ) {
				_timer.stop();
			
				_timer.removeEventListener(TimerEvent.TIMER, timerCount);
				_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerComplete);
			}
			
			_autoClose.removeEventListener(MouseEvent.CLICK, closeWindow);
		}
		
		protected function timerCount(event:TimerEvent):void
		{
			_autoClose.label = ResourceManager.getString("close") + " (" + (_seconds-_timer.currentCount) + ")";
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			if ( !_text ) {
				_text = new Text();
				_text.percentWidth = 100;
				addElement(_text);
			}
			
			if (!_autoClose ) {
				_autoClose = new Button();
				_autoClose.label = ResourceManager.getString("close") + " (" + _seconds + ")";
				_autoClose.addEventListener(MouseEvent.CLICK, closeWindow, false, 0, true);
				controlBarGroup.addElement(_autoClose);
			}
		}
		
		protected function closeWindow(event:MouseEvent):void
		{
			hide();
		}
		
		override protected function commitProperties():void {
			super.commitProperties();
			
			if ( _messageChanged ) {
				_messageChanged = false;
				_text.text = _message;
				startCounting();
			}
		}
		
		public function set message(value:String):void {
			_message = value;
			_messageChanged = true;
			invalidateProperties();
		}
	}
}