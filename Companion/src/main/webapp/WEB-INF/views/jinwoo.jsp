<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" type="text/css" href="${root}css/bootstrap.css">
    <style type="text/css">
    	.footer{
    		text-align: center;
    		color: gray;
    	}
    	.menubar{
    		position: fixed;
    		left: 30px;
    	}
    	.menubar>button{
    		padding-top:20px; 
    		padding-bottom:20px; 
    		padding-left:40px;
    		padding-right: 40px;
    	}
    	.carousel-center{
    		padding-left: 20%;
    		padding-right: 20%;
    	}
    </style>
    <script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${root }js/bootstrap.js"></script>
    <title>Companion</title>
</head>
<body>
<div class="header">
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	  	�̹���@
	  </div>
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar">1</span>
	        <span class="icon-bar">2</span>
	        <span class="icon-bar">3</span>
	      </button>
	      <a class="navbar-brand" href="#">Companion</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <form class="navbar-form navbar-left">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">Submit</button>
	      </form>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">�����ϱ�</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ȣ�ڼ��� <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">�����ϱ�</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">�̿�ȳ�</a></li>
	            <li><a href="#">���񽺼Ұ�</a></li>
	            <li><a href="#">�����̼Ұ�</a></li>
	            <li><a href="#">ȣ����ġ</a></li>
	          </ul>
	        </li>
	        <li><a href="#">�̺�Ʈ</a></li>
	        <li><a href="#">��������</a></li>
	        <li><a href="#">Q&A</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	    <button type="button" class="btn btn-default navbar-btn navbar-left">�α���</button>
	    <p class="navbar-text navbar-left"><a href="#" class="navbar-link">ȸ������</a></p>
	    <p class="navbar-text navbar-left"><a href="#" class="navbar-link">���̵�ã��</a></p>
	    <p class="navbar-text navbar-left"><a href="#" class="navbar-link">ȸ������ �� ù �ֹ��� 1000�� ���� ���� ����</a></p>
	  </div><!-- /.container-fluid -->
	</nav>
</div>
<div class="content">
	<div class="jumbotron">
	  <h1>Hello, world!</h1>
	  <p>...</p>
	  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
	</div>
	<div class="btn-group-vertical menubar" role="group" aria-label="...">
	  <button type="button" class="btn btn-default">������</button>
	  <button type="button" class="btn btn-default">�۾���</button>
	  <button type="button" class="btn btn-default">�߿���</button>
	  <button type="button" class="btn btn-default">ȣ����</button>
	  <button type="button" class="btn btn-default">������</button>
	</div>
	<div class="carousel-center">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner " role="listbox">
		    <div class="item active">
		      <img src="${root }imgs/pic1.png" alt="pic1">
		      <div class="carousel-caption">
		        ...1
		      </div>
		    </div>
		    <div class="item">
		      <img src="${root }imgs/pic2.png" alt="pic2">
		      <div class="carousel-caption">
		        ...2
		      </div>
		    </div>
		    <div class="item">
		      <img src="${root }imgs/pic3.png" alt="pic3">
		      <div class="carousel-caption">
		        ...3
		      </div>
		    </div>
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		<br/><br/>
	</div>

	<div class="row">
	  <div class="col-md-2 col-md-offset-2">
	    <div class="thumbnail">
	      <img src="..." alt="...">
	      <div class="caption">
	        <h3>Thumbnail label</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="..." alt="...">
	      <div class="caption">
	        <h3>Thumbnail label</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="..." alt="...">
	      <div class="caption">
	        <h3>Thumbnail label</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	  <div class="col-md-2">
	    <div class="thumbnail">
	      <img src="..." alt="...">
	      <div class="caption">
	        <h3>Thumbnail label</h3>
	        <p>...</p>
	        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<div class="footer">
	<nav class="navbar navbar-inverse">
			��ȣ:COMPANION | ��ǥ : �ֱ浿 | ����������ȣ����å���� : �ֱ浿 | ��ȭ : 02-0000-0000 | �̸��� : companion@companion.com<br />
		�ּ� : ����Ư���� ���ʱ� ������� 459 (���ʵ�, ��Ϻ���) 3�� | ����ڵ�Ϲ�ȣ : 000-00-00000 | ����Ǹ� : 2020-���ﰭ��-0000 ȣ���������� : ��Companion<br />
		[Ȩ������ �̿���] [����������޹�ħ]<br />
		Copyright �� 2020 COMPANION All rights reserved.
	</nav>
</div>  
</body>
</html>