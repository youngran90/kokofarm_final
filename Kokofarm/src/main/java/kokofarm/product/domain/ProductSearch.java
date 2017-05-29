package kokofarm.product.domain;

public class ProductSearch {

		private String searchOption;
		private String searchText;
		public String getSearchOption() {
			return searchOption;
		}
		public void setSearchOption(String searchOption) {
			this.searchOption = searchOption;
		}
		public String getSearchText() {
			return searchText;
		}
		public void setSearchText(String searchText) {
			this.searchText = searchText;
		}
		@Override
		public String toString() {
			return "ProductSearch [searchOption=" + searchOption + ", searchText=" + searchText + "]";
		}
		
		
		
		
		
	}

