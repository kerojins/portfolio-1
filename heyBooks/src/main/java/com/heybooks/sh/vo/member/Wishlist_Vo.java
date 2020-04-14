package com.heybooks.sh.vo.member;

import java.util.Date;

public class Wishlist_Vo {
		private int wishlist_num;
		private int members_num;
		private int product_num;
		private Date wishlist_date;
		public  Wishlist_Vo() {}
		public Wishlist_Vo(int wishlist_num, int members_num, int product_num, Date wishlist_date) {
			super();
			this.wishlist_num = wishlist_num;
			this.members_num = members_num;
			this.product_num = product_num;
			this.wishlist_date = wishlist_date;
		}
		public int getWishlist_num() {
			return wishlist_num;
		}
		public void setWishlist_num(int wishlist_num) {
			this.wishlist_num = wishlist_num; 
		}
		public int getMembers_num() {
			return members_num;
		}
		public void setMembers_num(int members_num) {
			this.members_num = members_num;
		}
		public int getProduct_num() {
			return product_num;
		}
		public void setProduct_num(int product_num) {
			this.product_num = product_num;
		}
		public Date getWishlist_date() {
			return wishlist_date;
		}
		public void setWishlist_date(Date wishlist_date) {
			this.wishlist_date = wishlist_date;
		}
		@Override
		public String toString() {
			return "Wishlist_Vo [wishlist_num=" + wishlist_num + ", members_num=" + members_num + ", product_num="
					+ product_num + ", wishlist_date=" + wishlist_date + "]";
		}
		 
		
}
