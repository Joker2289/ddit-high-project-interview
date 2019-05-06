package kr.or.ddit.util.chart;

public class ChartVo {
	
	private String chart_subject;	//차트 제목
	private int chart_value;		//차트 값
	
	public String getChart_subject() {
		return chart_subject;
	}
	public void setChart_subject(String chart_subject) {
		this.chart_subject = chart_subject;
	}
	public int getChart_value() {
		return chart_value;
	}
	public void setChart_value(int chart_value) {
		this.chart_value = chart_value;
	}
	@Override
	public String toString() {
		return "GraphVo [chart_subject=" + chart_subject + ", chart_value=" + chart_value + "]";
	}
	
	
}
