$(document).on('ready', function(){


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
  if($('#search_item_name').length > 0) {
    var item_search_timeoutId = 0;
    var input = $('#search_item_name')[0];
    var awesomplete = new Awesomplete(input, {
      minChars: 3,
      autoFirst: true
    });
  
    $(input).on("keyup", function(evt){ 
      var url = $(this.form).attr('action');
      var search = this.value;
  
      clearTimeout(item_search_timeoutId); // doesn't matter if it's 0
      item_search_timeoutId = setTimeout(function(){
        $.ajax({
          url: url+'.json',
          type: 'POST',
          dataType: 'json',
          data: { search: {item_name: search}}
        }).success(function(data) {
          var list = [];
          $.each(data, function(key, value) {
            list.push({ label: value.name + " | stk amount: "+ value.stock_amount, value: value.id });
          });
          awesomplete.list = list;
        });

        $.ajax({
          url: url,
          type: 'POST',
          dataType: 'script',
          data: { search: {item_name: search}}
        });
      }, 500);
    });
  
    Awesomplete.$.bind(input, {
      "awesomplete-selectcomplete": function(evt) {		  	
        let url = $(this.form).attr('action').replace(/\w+$/, 'create_line_item')
        $.ajax({
          type: "POST",
          url: url,
          data: { item_id: this.value},
          dataType: "script",
          success: function() {
            input.value = "";
          }
        });
      }
    });
  }

});
