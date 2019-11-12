package board;

public class Board { 
	private int num; //�Խ��� ��ȣ�� ���� �ʵ�
	private String title; //���� �ʵ�
	private String userid; //�ۼ��� �ʵ�
	private int count; //��ȸ�� �ʵ�
	private String date; //��¥ �ʵ�
	private String contents; //���� �ʵ�
	
	//get,set�Լ���
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
