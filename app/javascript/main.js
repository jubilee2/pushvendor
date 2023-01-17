$(document).on('ready', function(){

  var item_search_timeoutId = 0;
	$(document).on("keypress", '.item_search_input', function(){
    clearTimeout(item_search_timeoutId); // doesn't matter if it's 0
    item_search_timeoutId = setTimeout(function(){
      $('.item_search').click();
    }, 500);
	});

	$(document).on("change", '.item_category_search_input', function(){
	  $('.item_search').click();
	});

  var customer_search_timeoutId = 0;
	$(document).on("keypress", '.customer_search_input', function(){
    clearTimeout(customer_search_timeoutId); // doesn't matter if it's 0
    customer_search_timeoutId = setTimeout(function(){
      $('.customer_search').click();
    }, 500);
	});


	// creates a line item for a sale
	var input = $('#search_item_name')[0];
	var sale_id = $('#search_sale_id')[0];
	  Awesomplete.$.bind(input, {
		  "awesomplete-selectcomplete": function(evt) {		  	
		   $.ajax({
		      type: "GET",
		      url: '/sales/create_line_item', //sumbits it to the given url of the form
		      data: { item_id: parseInt(input.value.split(".|")[0]), quantity: 1, sale_id: parseInt(sale_id.value)},
		      dataType: "script",
		      success: function() {
		      	input.value = "";
		      }
		    });
		  }
		});

});
