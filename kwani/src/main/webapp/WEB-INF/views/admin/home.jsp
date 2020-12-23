<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	//장르 당 곡 카운트
	let genreCountList = ${
		getList};
	// 플레이어 카운트
	let playCountList = ${
		getListPlay
	};
	function drawChart() {

		let genreData = google.visualization.arrayToDataTable([ [ '노래', '갯수' ],
				[ '힙합', genreCountList[0].COUNT ],
				[ '발라드', genreCountList[1].COUNT ], [ '락', 5 ], [ '댄스', 5 ] ]);
		let playData = google.visualization.arrayToDataTable([
				[ '일자', '플레이 횟수', {
					role : 'style'
				}, ],
				[ playCountList[0].PLAYDT, playCountList[1].PLAY, 'red' ],
				[ playCountList[1].PLAYDT, playCountList[2].PLAY, 'orange' ],
				[ playCountList[2].PLAYDT, playCountList[3].PLAY, 'yellow' ],
				[ playCountList[3].PLAYDT, playCountList[4].PLAY, 'green' ],
				[ playCountList[4].PLAYDT, playCountList[5].PLAY, 'blue' ],
				[ playCountList[5].PLAYDT, playCountList[6].PLAY, 'purple' ],

		]);

		let genreOptions = {
			title : '장르별 노래 CHART'
		};
		let playOptions = {
			
			chartArea : {
				width : '80%'
			},
			hAxis : {
				title : '일일 플레이 수',
				minValue : 0
			},
			vAxis : {
				title : '일자'
			}
		}

		let genreChart = new google.visualization.PieChart(document
				.getElementById('piechart'));
		let playChart = new google.visualization.BarChart(document
				.getElementById('barchart'));
		genreChart.draw(genreData);
		playChart.draw(playData, playOptions);
	}
</script>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			<h4>BAAM CHART</h4>
			</div>
		</div>
		<!-- /.panel -->
	</div>
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">장르 당 곡 수</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div id=piechart></div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-md-12 -->
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">일간 총 플레이 횟수</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div id="barchart"></div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</div>

	




	<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>