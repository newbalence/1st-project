package board;

import java.util.HashMap;
import java.util.Map;

public class ConvertBoardType {
	
	private static Map<String, String> boardTypeCode = new HashMap<String, String>();
	
	static {
		boardTypeCode.put("1", "보드게임");
		boardTypeCode.put("2", "캘리그래피");
		boardTypeCode.put("3", "요리");
		boardTypeCode.put("4", "코스프레");
		boardTypeCode.put("5", "영화/드라마");
		boardTypeCode.put("6", "뜨개질");
		boardTypeCode.put("7", "음악 감상");
		boardTypeCode.put("8", "종이접기");
		
		boardTypeCode.put("10", "하이킹");
		boardTypeCode.put("11", "승마");
		boardTypeCode.put("12", "등산");
		boardTypeCode.put("13", "암벽등반");
		boardTypeCode.put("14", "러닝");
		boardTypeCode.put("15", "스쿠버 다이빙");
		boardTypeCode.put("16", "수영");
		boardTypeCode.put("17", "스키");
		
		boardTypeCode.put("20", "피규어");
		boardTypeCode.put("21", "트레이딩 카드");
		boardTypeCode.put("22", "골동품 수집");
		boardTypeCode.put("23", "우표 수집");
		boardTypeCode.put("24", "주화 수집");
		boardTypeCode.put("25", "금속 탐지");
		
		boardTypeCode.put("30", "축구");
		boardTypeCode.put("31", "야구");
		boardTypeCode.put("32", "체스");
		boardTypeCode.put("33", "바둑");
		boardTypeCode.put("34", "배드민턴");
		boardTypeCode.put("35", "당구");
		boardTypeCode.put("36", "포커");
		boardTypeCode.put("37", "마작");
		
		boardTypeCode.put("40", "여행");
		boardTypeCode.put("41", "타로");
		boardTypeCode.put("42", "천문");
		
		boardTypeCode.put("50", "학습");
	}
	
	public static String getBoardTye(String boardType) {
		return boardTypeCode.get(boardType);
	}
}
