package com.tarena.netctoss.entity.page;

public class Page {
	private int currentPage =1;
	private int pageSize = 5;
	
	//使用Oracle Oracle中分页查询需要两个起点和终点的查询条件
	private int begin;
	private int end;
	
	//总行数，用于计算最大页数
	private int rows;
	//计算最大页数
	private int totalPage;
	
	//计算上一页
	private int prePage;
	
	//计算下一页
	private int nextPage;
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBegin() {
		
		return (this.currentPage-1)*pageSize;
	}
	 
	public int getEnd() {
		return this.currentPage*pageSize;
	}
	
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getTotalPage() {
		return rows%pageSize==0?rows/pageSize:rows/pageSize+1;
	}
	
	//计算上一页
	public int getPrePage() {
		if(currentPage==1){
			return 1;
		}
		return currentPage-1;
	}
	//计算下一页
	public int getNextPage() {
		if(currentPage==this.getTotalPage()){
			return this.getTotalPage();
		}
		return currentPage+1;
	}
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize
				+ ", begin=" + begin + ", end=" + end + ", rows=" + rows
				+ ", totalPage=" + totalPage + ", prePage=" + prePage
				+ ", nextPage=" + nextPage + "]";
	}
	
	
	
}
