package kr.or.ddit.ability.model;

public class AbilityVo {
	
	private String ability_code;
	private String user_id;
	private String ability_item;
	
	public String getAbility_code() {
		return ability_code;
	}
	public void setAbility_code(String ability_code) {
		this.ability_code = ability_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAbility_item() {
		return ability_item;
	}
	public void setAbility_item(String ability_item) {
		this.ability_item = ability_item;
	}
	@Override
	public String toString() {
		return "AbilityVo [ability_code=" + ability_code + ", user_id=" + user_id + ", ability_item=" + ability_item
				+ "]";
	}
	
	
	
}
