package board;

public class SearchVO {
	private String searchType;
	private String keyword;
	private int startNum;
	private int limitSize;
	private String selectlist;
	private String boardType;
	private String listType;
	
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getSelectlist() {
		return selectlist;
	}
	public void setSelectlist(String selectlist) {
		this.selectlist = selectlist;
	}
	public String getSearchType() {
		return searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public int getStartNum() {
		return startNum;
	}
	public int getLimitSize() {
		return limitSize;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public void setLimitSize(int limitSize) {
		this.limitSize = limitSize;
	}
	
	
	
	
	
}
