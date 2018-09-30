package com.logMonitorDeepak;

import java.util.List;

public class IndexForm {
	private String logUrl;
	private String exceptionLog;
	private List<String> exceptionList;
	private Integer exceptionCount;
	private boolean invalidPath;

	public boolean isInvalidPath() {
		return invalidPath;
	}

	public void setInvalidPath(boolean invalidPath) {
		this.invalidPath = invalidPath;
	}

	public Integer getExceptionCount() {
		return exceptionCount;
	}

	public void setExceptionCount(Integer exceptionCount) {
		this.exceptionCount = exceptionCount;
	}

	public List<String> getExceptionList() {
		return exceptionList;
	}

	public void setExceptionList(List<String> exceptionList) {
		this.exceptionList = exceptionList;
	}

	public String getExceptionLog() {
		return exceptionLog;
	}

	public void setExceptionLog(String exceptionLog) {
		this.exceptionLog = exceptionLog;
	}

	public String getLogUrl() {
		return logUrl;
	}

	public void setLogUrl(String logUrl) {
		this.logUrl = logUrl;
	}
	
}
