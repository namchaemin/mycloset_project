package bitcamp.java87.project01.service;

import java.util.Map;

import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.domain.Search;


public interface StyleService {
	
	public Map<String , Object> getStyleList(Search search) throws Exception;

	public void addStyle(Style style)throws Exception;

	public Style getStyle()throws Exception;

	public void updateStyle(Style style)throws Exception;

	
}