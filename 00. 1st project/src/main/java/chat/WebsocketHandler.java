package chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

//jsp에서 전달한 채팅을 재전파
@ServerEndpoint("/chat")
public class WebsocketHandler {
	
	private final static Map<String, Session> clients = new HashMap<>();
	
	//jsp에서 웹소켓 연결 되었을 때 동작
	@OnOpen
	public void open(Session session) {
		clients.put(session.getId(), session);
	}
	
	//jsp에서 웹소켓 연결이 해제되었을 때 동작
	@OnClose
	public void close(Session session) {
		clients.remove(session.getId());
	}
	
	//jsp에서 웹소켓으로 데이터를 전달할 때 동작
	@OnMessage
	public void message(String message, Session session) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			ChatVO chatVO = mapper.readValue(message, ChatVO.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		try {
			for( String key : clients.keySet() ){
				if(clients.get(key).isOpen()) {
					clients.get(key).getBasicRemote().sendText(message);
				}
		     }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
