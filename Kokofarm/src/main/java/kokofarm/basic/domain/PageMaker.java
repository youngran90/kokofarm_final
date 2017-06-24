package kokofarm.basic.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

  private int totalCount;
  private int startPage;
  private int endPage;
  private boolean prev;
  private boolean next;
  private int lastPage;
  private int cpage = 1;  //현재페이지
  private int start;
  private int end;
  private int displayPageNum = 4;  //보여줄 페이지
  private int perPageNum = 5; //페이지당 보여줄 갯수
  private Criteria cri;
  
   
  

public int getPerPageNum() {
	return perPageNum;
}

public void setPerPageNum(int perPageNum) {
	this.perPageNum = perPageNum;
}

public int getCpage() {
	return cpage;
}

public void setCpage(int cpage) {
	this.cpage = cpage;
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

  public void setCri(Criteria cri) {
    this.cri = cri;
  }

  public void setTotalCount(int totalCount,int cpage) {
    this.totalCount = totalCount;
    this.cpage = cpage;
    calcData();
  }

 /* private void calcData() {

    endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

    startPage = (endPage - displayPageNum) + 1;

    int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

    if (endPage > tempEndPage) {
      endPage = tempEndPage;
    }

    prev = startPage == 1 ? false : true;

    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    
    lastPage = (totalCount / displayPageNum) +1;
   
    int start = 0;
	int end = 0;
	
	start = displayPageNum * (cpage - 1) + 1; // 시작위치
	end = (displayPageNum * (cpage - 1)) + displayPageNum;
	
	this.start = start;
	this.end = end;
	

  }*/

  private void calcData() {

	    endPage = (int) (Math.ceil(getCpage() / (double) displayPageNum) * displayPageNum);

	    startPage = (endPage - displayPageNum) + 1;

	    int tempEndPage = (int) (Math.ceil(totalCount / (double) getPerPageNum()));

	    if (endPage > tempEndPage) {
	      endPage = tempEndPage;
	    }

	    prev = startPage == 1 ? false : true;

	    next = endPage * getPerPageNum() >= totalCount ? false : true;
	    
	    lastPage = (totalCount / displayPageNum) +1;
	   
	    int start = 0;
		int end = 0;
		
		start = displayPageNum * (cpage - 1) + 1; // 시작위치
		end = (displayPageNum * (cpage - 1)) + displayPageNum;
		
		this.start = start;
		this.end = end;

	  }
  
  
  
  
  public int getTotalCount() {
    return totalCount;
  }

  public int getStartPage() {
    return startPage;
  }

  public int getEndPage() {
    return endPage;
  }

  public boolean isPrev() {
    return prev;
  }

  public boolean isNext() {
    return next;
  }

  public int getDisplayPageNum() {
    return displayPageNum;
  }

  public Criteria getCri() {
    return cri;
  }

  
  public int getLastPage() {
	return lastPage;
}


public String makeQuery(int page) {

    UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
        .queryParam("perPageNum", cri.getPerPageNum()).build();

    return uriComponents.toUriString();
  }
  
  
  public String makeSearch(int page){
    
    UriComponents uriComponents =
              UriComponentsBuilder.newInstance()
              .queryParam("page", page)
              .queryParam("perPageNum", cri.getPerPageNum())
              .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
              .queryParam("keyword", ((SearchCriteria)cri).getKeyword())
              .build();             
    
    return uriComponents.toUriString();
  } 
  
  private String encoding(String keyword){
	  if(keyword == null || keyword.trim().length() == 0){
		  return "";
	  }
	  try{
		  return URLEncoder.encode(keyword, "UTF-8");
	  }catch (UnsupportedEncodingException e) {
		return "";
	}
  }

@Override
public String toString() {
	return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
			+ prev + ", next=" + next + ", lastPage=" + lastPage + ", cpage=" + cpage + ", start=" + start + ", end="
			+ end + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
}


  
  
}
