function count(array_elements) {
    var re = [];
    array_elements.sort();
    var current = null;
    var cnt = 0;
    for (var i = 0; i < array_elements.length; i++) {
        if (array_elements[i] != current) {
            if (cnt > 0) {
                // console.log(current + ' comes --> ' + cnt + ' times<br>');
                re.push([new Date(current), cnt]);
            }
            current = array_elements[i];
            cnt = 1;
        } else {
            cnt++;
        }
    }
    if (cnt > 0) {
        // console.log(current + ' comes --> ' + cnt + ' times');
        re.push([new Date(current), cnt]);
    }
    return re;
}

function search_trigeer(clicked_id){
    // $(this).closest("tr");
    console.log("TEST " +  clicked_id);
    $('#dataTables-example').DataTable().search(clicked_id).draw();
}

function googleChart(dataSet){
    google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Time of Day');
        data.addColumn('number', 'Rating');

        data.addRows(dataSet);
        data.addRows([[new Date(2015, 0, 1), 5]])


        var options = {
          title: 'Rate the Day on a Scale of 1 to 10',
          width: 800,
          height: 500,
          hAxis: {
            format: 'MMM dd, yyyy',
            gridlines: {count: 15}
          },
          vAxis: {
            gridlines: {color: 'none'},
            minValue: 0
          },
          backgroundColor: '#f1f8e9',
          legend: {position: 'none'}
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

        chart.draw(data, options);

        // var button = document.getElementById('change');

        // button.onclick = function () {

        //   // If the format option matches, change it to the new option,
        //   // if not, reset it to the original format.
        //   options.hAxis.format === 'M/d/yy' ?
        //   options.hAxis.format = 'MMM dd, yyyy' :
        //   options.hAxis.format = 'M/d/yy';

        //   chart.draw(data, options);
        // };
    }
}