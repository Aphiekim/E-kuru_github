package com.scit.ekuru.vo;

public class TextVO {
	private String source;
	private String target;
	private String text;

	public TextVO() {
		super();
	}

	public TextVO(String source, String target, String text) {
		super();
		this.source = source;
		this.target = target;
		this.text = text;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "TextVO [source=" + source + ", target=" + target + ", text=" + text + "]";
	}
}
