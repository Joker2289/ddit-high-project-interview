package kr.or.ddit.util.pagination;

public class PaginationVo {
	private int page;		//page번호
	private int pageSize;	//page당 사이즈
	private String mem_id;
	
	public PaginationVo() {
		
	}
	public PaginationVo(int page, int pageSize) {
		this.page = page;
		this.pageSize = pageSize;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPage() {
		return page == 0 ? 1 : page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize == 0 ? 10 : pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + "]";
	}
}
