package kokofarm.product.domain;

import kokofarm.basic.domain.PageMaker;

public class ProductListForm {

		private String ca1;
		private String ca2;
		private String ca3;
		private PageMaker pageMaker;
	    private String input_sort = "ph";
	    private String searchText;
	    private String searchOption;
	    
	    
	    
		public String getSearchText() {
			return searchText;
		}
		public void setSearchText(String searchText) {
			this.searchText = searchText;
		}
		public String getSearchOption() {
			return searchOption;
		}
		public void setSearchOption(String searchOption) {
			this.searchOption = searchOption;
		}
		public String getInput_sort() {
			return input_sort;
		}
		public void setInput_sort(String input_sort) {
			this.input_sort = input_sort;
		}
		public String getCa1() {
			return ca1;
		}
		public void setCa1(String ca1) {
			this.ca1 = ca1;
		}
		public String getCa2() {
			return ca2;
		}
		public void setCa2(String ca2) {
			this.ca2 = ca2;
		}
		public String getCa3() {
			return ca3;
		}
		public void setCa3(String ca3) {
			this.ca3 = ca3;
		}
		public PageMaker getPageMaker() {
			return pageMaker;
		}
		public void setPageMaker(PageMaker pageMaker) {
			this.pageMaker = pageMaker;
		}
		
		
	}

