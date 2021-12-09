<%@page import="model.Category"%>
<%@page import="model.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Writer"%>
<%@page import="model.Category"%>
<%@page import="BO.CategoryBO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Cake Ice Cream</title>
<!-- Thêm chân trang -->
<jsp:include page="layout/head.jsp"></jsp:include>
<!-- Xong thêm chân trang -->

</head>

<body>
	<%
		ArrayList<Products> products = (ArrayList<Products>) request.getAttribute("lstProducts");
		ArrayList<Products> productstop8 = (ArrayList<Products>) request.getAttribute("lstProductstop8");
		ArrayList<Category> category = (ArrayList<Category>) request.getAttribute("lstCategory");
	
	%>

	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->
	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>Danh Mục Sản Phẩm</span>
						</div>
						<ul>
							<%
													for (Category ds : category) {
												%>
							<li><a
								href="HomeProductsServlet?id_category=<%=ds.getId()%>"><%=ds.getTenLoaiSanPham()%>
							</a></li>
							<%
													}
												%>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="HomeSearchProduct" method="get">

								<input name="key" type="text" placeholder="Bạn muốn tìm gì?">
								<button type="submit" class="site-btn">TÌM KIẾM</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>012345678</h5>
								<span>Hộ trợ 24/7</span>
							</div>
						</div>
					</div>
					<div class="hero__item set-bg"
						data-setbg="viewroot/img/banner/banner.jpg">
						<div class="hero__text">
							<span>NGỌT NGÀO</span>
							<h2>
								Cake Ice Cream <br />100% Organic
							</h2>
							<p>Ngọt Ngào Từ Trái Tim -Đậm Đà Từ Hướng vị</p>
							<a href="#" class="primary-btn">Bắt Đầu</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">

				<div class="categories__slider owl-carousel">
					<%
				for (Products ls : products) {
			%>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="viewroot/img/shop/product/<%=ls.getAnhChinh()%>">
							<h5>
								<a href="HomeProductsDetail?id=<%=ls.getId()%>"><%=ls.getTenSanPham()%></a>
							</h5>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Sản phẩm nỗi bật</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">Tất cả</li>
							<%
				for (int i=0;i<5;i++) {
			%>

							<li data-filter=".oranges<%=category.get(i).getId()%>"><%=category.get(i).getTenLoaiSanPham()%></li>
							<%
				}
			%>

						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<%
					int max = 33;
					int numb = products.size();
					DecimalFormat numformat = new DecimalFormat("#,###,###");
					if (numb < max) {
						for (Products ls : productstop8) {
				%>
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix oranges<%=ls.getId_loaiSanPham()%> ">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="viewroot/img/shop/product/<%=ls.getAnhChinh()%>">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a onclick="addProductToCart(<%=ls.getId()%>)"><i
										class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="">
							<h6>
								<a href="HomeProductsDetail?id=<%=ls.getId()%>"><%=ls.getTenSanPham()%></a>
							</h6>
							<%
								if (ls.getTinhTrang() == 1) {
											if (ls.getKhuyenMai() > 0) {
							%>
							<div class="price-up-down">
								<span class="sale-new">Giảm <%=ls.getKhuyenMai()%>%
								</span>
							</div>
							<%
								}
										} else {
							%>
							<div class="price-up-down">
								<span class="sale-new">Hot </span>
							</div>
							<%
								}
							%>

							<h5>
								<%
										double price = ls.getGiaGoc();
												int sale = ls.getKhuyenMai();
												price = price - (price * sale / 100);
												String price_nb = numformat.format(price);
									%>
								<%=price_nb%>đ
							</h5>
						</div>
					</div>
				</div>
				<%
					}
					} else {
						for (int i = 0; i < max; i++) {
				%>
				<div
					class="col-lg-3 col-md-4 col-sm-6 mix oranges<%=products.get(i).getId_loaiSanPham()%>">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="viewroot/img/shop/product/<%=products.get(i).getAnhChinh()%>">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#" onclick="addProductToCart(<%=products.get(i).getId()%>)"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="HomeProductsDetail?id=<%=products.get(i).getId()%>"><%=products.get(i).getTenSanPham()%></a>
							</h6>
							<%
								if (products.get(i).getTinhTrang() == 1) {
											if (products.get(i).getKhuyenMai() > 0) {
							%>
							<span class="sale-new">Giảm <%=products.get(i).getKhuyenMai()%>%
							</span>
						</div>
						<%
								}
										} else {
							%>
						<div class="price-up-down">
							<span class="sale-new">Hết bán </span>
						</div>
						<%
								}
							%>
						<h5>
							<%
										double price = products.get(i).getGiaGoc();
												int sale = products.get(i).getKhuyenMai();
												price = price - (price * sale / 100);
												String price_nb = numformat.format(price);
									%>
							<%=price_nb%>
							đ
						</h5>
					</div>
				</div>
			</div>
			<%
					}
					}
				%>
		</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="img/banner/banner-1.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="img/banner/banner-2.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->

	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Sản Phẩm Mới</h4>
						<div class="latest-product__slider owl-carousel">
							<%
				for (int i=0;i<2;i++) {
					if(i==0){
						
			%>

							<div class="latest-prdouct__slider__item">
								<%
							int count=0;
				for (Products ls : products) {
					if(count<4 && ls.getId_loaiSanPham()==7){
						count++;
					
				
			%>
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="viewroot/img/shop/product/<%=ls.getAnhChinh()%>"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6><%=ls.getTenSanPham()%>"
										</h6>
										<span><%=ls.getGiaGoc()%>"</span>
									</div>
								</a>
								<%} }%>
							</div>
							<% } else{ %>

							<div class="latest-prdouct__slider__item">

								<%
							int count=0;
				for (Products ls : products) {
					if(count<4 && ls.getId_loaiSanPham()==7){
						count++;
					
				
			%>
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="viewroot/img/shop/product/<%=ls.getAnhChinh()%>"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6><%=ls.getTenSanPham()%>"
										</h6>
										<span><%=ls.getGiaGoc()%>"</span>
									</div>
								</a>
								<%} }%>
							</div>
							<%}} %>
						</div>

					</div>

				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Sản Phẩm Bán Chạy</h4>
						<div class="latest-product__slider owl-carousel">
							<%
				for (int i=0;i<2;i++) {
					if(i==0){
						
			%>

							<div class="latest-prdouct__slider__item">
								<%
							int count=0;
				for (Products ls : products) {
					if(count<4 && ls.getId_loaiSanPham()==8){
						count++;
					
				
			%>
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="viewroot/img/shop/product/<%=ls.getAnhChinh()%>"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6><%=ls.getTenSanPham()%>"
										</h6>
										<span><%=ls.getGiaGoc()%>"</span>
									</div>
								</a>
								<%} }%>
							</div>
							<% } else{ %>

							<div class="latest-prdouct__slider__item">

								<%
							int count=0;
				for (Products ls : products) {
					if(count<4 && ls.getId_loaiSanPham()==10){
						count++;
					
				
			%>
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="viewroot/img/shop/product/<%=ls.getAnhChinh()%>"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6><%=ls.getTenSanPham()%>"
										</h6>
										<span><%=ls.getGiaGoc()%>"</span>
									</div>
								</a>
								<%} }%>
							</div>
							<%}} %>
						</div>

					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Top Review</h4>
						<div class="latest-product__slider owl-carousel">
							<%
				for (int i=0;i<2;i++) {
					if(i==0){
						
			%>

							<div class="latest-prdouct__slider__item">
								<%
							int count=0;
				for (Products ls : products) {
					if(count<4 && ls.getId_loaiSanPham()==7){
						count++;
					
				
			%>
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="viewroot/img/shop/product/<%=ls.getAnhChinh()%>"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6><%=ls.getTenSanPham()%>"
										</h6>
										<span><%=ls.getGiaGoc()%>"</span>
									</div>
								</a>
								<%} }%>
							</div>
							<% } else{ %>

							<div class="latest-prdouct__slider__item">

								<%
							int count=0;
				for (Products ls : products) {
					if(count<4 && ls.getId_loaiSanPham()==7){
						count++;
					
				
			%>
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="viewroot/img/shop/product/<%=ls.getAnhChinh()%>"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6><%=ls.getTenSanPham()%>"
										</h6>
										<span><%=ls.getGiaGoc()%>"</span>
									</div>
								</a>
								<%} }%>
							</div>
							<%}} %>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->
	<section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>Góc Hồn Thơ</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="viewroot/img/blog/blog-1.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> 10-20-2021</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">Bánh của sử ngọt ngào</a>
							</h5>
							<p>Bánh mang đến vị ngọt của thiên nhiên và vẻ đẹp của sự
								xanh ngọt của bánh</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="viewroot/img/blog/blog-2.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i>10-20-2021</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">Sản phẩm tốt từ bạn</a>
							</h5>
							<p>Ngọt ngào từ trái tim - tình yêu như miếng bánh ngọt ngào
								trái tim bé nhở như nàng thơ ngọt ngào</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="viewroot/img/blog/blog-3.jpg" alt="">
						</div>
						<div class="blog__item__text">
							<ul>
								<li><i class="fa fa-calendar-o"></i> 10-20-2021</li>
								<li><i class="fa fa-comment-o"></i> 5</li>
							</ul>
							<h5>
								<a href="#">Bánh làm từ trái tim đầu bếp</a>
							</h5>
							<p>Ngọt ngào từ trái tim - tình yêu như miếng bánh ngọt ngào
								trái tim bé nhở như nàng thơ ngọt ngào</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Thêm chân trang -->
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->




</body>

</html>