package board;

public class Member {
	private String userid; //ȸ��id�� ���� �ʵ�
	private String passwd; //ȸ���� passwd�� ���� �ʵ�
	private String tel; //ȸ���� �޴�����ȣ�� ���� �ʵ�
	private String email;
	private int count;
	
	//get,set�Լ�
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUserid(String userid){
		this.userid=userid;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setPasswd(String passwd){
		this.passwd=passwd;
	}
	public String getUserid(){
		return userid;
	}
	public String getPasswd(){
		return passwd;
	}

}

