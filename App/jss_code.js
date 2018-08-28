
      google.charts.load('current', {'packages':['corechart']});  //Load chart package
      google.charts.setOnLoadCallback(drawChart1); // Call chart functions
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart1() {

        var data = google.visualization.arrayToDataTable([
          ['Name', 'Key'],
          ['Free',     60],
          ['Engage',    30]
        ]);

        var options = {
          title: 'Trucks'
        };

        var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart1.draw(data, options);
        
      }


    function drawChart2() {

        var data = google.visualization.arrayToDataTable([
          ['Name', 'Key'],
          ['Free',     60],
          ['Engage',    30]
        ]);

        var options = {
          title: 'Trucks'
        };

        var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart2.draw(data, options);
        
      }
