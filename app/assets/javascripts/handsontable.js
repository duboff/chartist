    
var data = [
    ["stuff", "Maserati", "Mazda", "Mercedes", "Mini", "Mitsubishi"],
    ["2009", 0, 2941, 4303, 354, 5814],
    ["2010", 5, 2905, 2867, 412, 5284],
    ["2011", 4, 2517, 4822, 552, 6127],
    ["2012", 2, 2422, 5399, 776, 4151]
  ];

$(document).ready(function () {
    
  $('#example').handsontable({
    data: data,
    minSpareRows: 0,
    colHeaders: true,
    contextMenu: true
  });
  
  
  function bindDumpButton() {
      $('body').on('click', 'button[name=dump]', function () {
        var dump = $(this).data('dump');
        var $container = $(dump);
        console.log('data of ' + dump, $container.handsontable('getData'));
      });
    }
  bindDumpButton();
 var csvContent = "";
data.forEach(function(infoArray, index){

   dataString = infoArray.join(",");
   csvContent += index < infoArray.length ? dataString+ "\n" : dataString;

}); 
    
//       var encodedUri = encodeURI(csvContent);
// var link = document.createElement("a");
// var hiddenField

    $('#download').on('click', function () {
        $(".hidden-field").val(JSON.stringify(csvContent))
    });
  
});

// XXXXXXXXXX OUR code