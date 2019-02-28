package com.xc.page;

import java.util.List;

public class PageBean<T> {

	private int currentPage; //��ǰҳ
	private int totalPage; 	//��ҳ��
	private int pageSize; 	//ÿҳ��ʾ����
	private int totalRecord;	//�ܵ�ѧ������
	
	private int startIndex;
	
	private List<T> data;

	private int start;
	private int end;
	
	public PageBean(int currentPage, int totalRecord, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.pageSize = pageSize;
		//����
		//1.��ʼ����
		this.startIndex = (this.currentPage - 1)*this.pageSize;
		
		//�ܷ�ҳ��
		this.totalPage = (this.totalRecord + this.pageSize -1)/this.pageSize;
		
		if(this.totalPage <= 10){
			this.start = 1;
			this.end = this.totalPage;
		}else{
			if(this.currentPage<=5){
				this.start = 1;
				this.end = 10;
			}if(this.currentPage > 5){
				if(this.currentPage+5 > this.totalPage){
					this.start = this.totalPage - 9;
					this.end = this.totalPage;
				}else{
					this.start = this.currentPage - 4;
					this.end = this.currentPage + 5;
				}
			}
		}
	}

	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
	
	
}
