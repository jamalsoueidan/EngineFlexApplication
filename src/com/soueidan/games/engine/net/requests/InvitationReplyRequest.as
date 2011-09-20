package com.soueidan.games.engine.net.requests
{
	import com.smartfoxserver.v2.entities.data.ISFSObject;
	import com.smartfoxserver.v2.entities.invitation.Invitation;
	import com.smartfoxserver.v2.requests.game.InvitationReplyRequest;
	
	public class InvitationReplyRequest extends com.smartfoxserver.v2.requests.game.InvitationReplyRequest
	{
		public function InvitationReplyRequest(invitation:Invitation, invitationReply:int, params:ISFSObject=null)
		{
			super(invitation, invitationReply, params);
		}
	}
}