package kr.or.ddit.files.model;

public class FilesVo {
	
	private String file_code;	// 파일코드
	private String ref_code;	// 참조코드
	private String division;	// 구분
	private String file_name;	// 파일이름
	private String file_path;	// 파일경로
	
	public FilesVo() {
		
	}

	public String getFile_code() {
		return file_code;
	}

	public void setFile_code(String file_code) {
		this.file_code = file_code;
	}

	public String getRef_code() {
		return ref_code;
	}

	public void setRef_code(String ref_code) {
		this.ref_code = ref_code;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	@Override
	public String toString() {
		return "FilesVo [file_code=" + file_code + ", ref_code=" + ref_code + ", division=" + division + ", file_name="
				+ file_name + ", file_path=" + file_path + "]";
	}

}
