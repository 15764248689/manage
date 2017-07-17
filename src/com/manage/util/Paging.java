package com.manage.util;

//���ڷ�ҳ�Ĺ�����
public class Paging {

	private Integer count;//	������
	private Integer totalNumberPage;//	��ҳ��
	private Integer startPage;//	��ʼҳ��
	private Integer startNumber;// ��ʼ����
	private Integer pageSize;//	ÿҳ����
	private Integer showPage;//��ʾ��ҳ����
	private Integer showStart;//Ҫ��ʾ�ĵ�һ����ҳ��
	private Integer showEnd;//Ҫ��ʾ��ĩβ��ҳ��
	private boolean showStart1;//��ʼҳ�Ƿ��ǵ�һҳ
	private boolean showEnd1;//ĩβҳ�Ƿ������һҳ
	
	

	public Paging(Integer count,Integer startPage,Integer pageSize,Integer showPage){
		this.count = count;
		this.pageSize = pageSize;
		this.startPage = startPage;
		this.showPage = showPage;
		this.totalNumberPage = count%this.pageSize ==0?count/this.pageSize:count/this.pageSize + 1;
		this.startNumber = (startPage-1)*pageSize;
		
		if(this.startPage <= showPage/2+1||this.totalNumberPage <= showPage){
			this.showStart = 1;
			this.showStart1 = true;
		}else if(this.startPage <= totalNumberPage - showPage/2 + 1){
			this.showStart = startPage - showPage/2;
			this.showStart1 = false;
		}else{
			this.showStart = totalNumberPage - showPage+1;
			this.showStart1 = false;
		}
		
		if(this.totalNumberPage <= showPage){
			this.showEnd = this.totalNumberPage;
			this.showEnd1 = true;
		}else{
			if(this.showStart + showPage - 1 < totalNumberPage){
				this.showEnd = this.showStart + showPage - 1;
				this.showEnd1 = false;
			}else if(this.showStart + showPage - 1 == totalNumberPage){
				this.showEnd = this.showStart + showPage - 1;
				this.showEnd1 = true;
			}else{
				this.showEnd = this.totalNumberPage;
				this.showEnd1 = true;
			}
		}
		
	}
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getTotalNumberPage() {
		return totalNumberPage;
	}
	public void setTotalNumberPage(Integer totalNumberPage) {
		this.totalNumberPage = totalNumberPage;
	}
	public Integer getStartPage() {
		return startPage;
	}
	public void setStartPage(Integer startPage) {
		this.startPage = startPage;
	}
	public Integer getStartNumber() {
		return startNumber;
	}

	public void setStartNumber(Integer startNumber) {
		this.startNumber = startNumber;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getShowStart() {
		return showStart;
	}

	public void setShowStart(Integer showStart) {
		this.showStart = showStart;
	}

	public Integer getShowEnd() {
		return showEnd;
	}

	public void setShowEnd(Integer showEnd) {
		this.showEnd = showEnd;
	}

	public Integer getShowPage() {
		return showPage;
	}

	public void setShowPage(Integer showPage) {
		this.showPage = showPage;
	}

	public boolean isShowStart1() {
		return showStart1;
	}

	public void setShowStart1(boolean showStart1) {
		this.showStart1 = showStart1;
	}

	public boolean isShowEnd1() {
		return showEnd1;
	}

	public void setShowEnd1(boolean showEnd1) {
		this.showEnd1 = showEnd1;
	}
}
