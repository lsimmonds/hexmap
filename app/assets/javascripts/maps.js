var last_map_country_id=null;
var last_map_country_value=null;
var last_map_province_id=null;
var last_map_province_value=null;

update_country =
  function(id,country,country_field_name,country_field_value) {
    $.ajax({
      type: 'POST',
      url: '/countries/'+id,
      async: true,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: country,
      dataType: "json",
      complete: function(data){
        console.log("complete! "+JSON.stringify(data));
      },
      error: function(data){
        console.log("error! "+JSON.stringify(data));
      },
      success: function(data){
        console.log("success! "+JSON.stringify(data));
        $( "#country_"+country_field_name+"_"+id ).html(country_field_value);
        last_map_country_value=country_field_value;
      }
    });
  };

update_province =
  function(id,province,province_field_name,province_field_value) {
    $.ajax({
      type: 'PUT',
      url: '/provinces/'+id,
      async: true,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: province,
      dataType: "json",
      complete: function(data){
        console.log("complete! "+JSON.stringify(data));
      },
      error: function(data){
        console.log("error! "+JSON.stringify(data));
      },
      success: function(data){
        console.log("success! "+JSON.stringify(data));
        $( "#province_"+province_field_name+"_"+id ).html(province_field_value);
        last_map_province_value=province_field_value;
      }
    });
  };

add_province =
  function(payload,map_id,province) {
    $.ajax({
      type: 'PUT',
      url: '/maps/'+map_id,
      async: true,
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: payload,
      dataType: "json",
      complete: function(data){
        console.log("complete! "+JSON.stringify(data));
      },
      error: function(data){
        console.log("error! "+JSON.stringify(data));
      },
      success: function(data){
        console.log("success! "+JSON.stringify(data));
        $( ".province_list" ).append( '<div class="province_element">Name: <div class="province_data" id="province_name_'+data["id"]+'">'+province["name"]+'&nbsp;</div></div>',
                                      '<div class="province_element">Name: <div class="province_data" id="province_description_'+data["id"]+'">'+province["description"]+'&nbsp;</div></div>',
                                      '<div class="province_element">Name: <div class="province_data" id="province_color_'+data["id"]+'">'+province["color"]+'&nbsp;</div></div>',
                                      '<div class="province_element">Name: <div class="province_data" id="province_color_name_'+data["id"]+'">'+province["color_name"]+'&nbsp;</div></div>',
                                      '</br>' );
        $('.new_province input[type="text"]').val('');
      }
    });
  };

load_funcs =
  function () {
    $('.country_data').keypress(function(e) {
      if( $( "#country_value" )[0] ) {
        if(e.keyCode == 13) {
          var id_lbl_arr=$( this ).attr('id').split('_');;
          var country_id = id_lbl_arr[id_lbl_arr.length - 1];
          var country_field_name = id_lbl_arr[1];
          if(id_lbl_arr.length > 3) {
            country_field_name += "_" + id_lbl_arr[2];
          }
          var country = {};
          country["country"] = {};
          country["country"][country_field_name] = $( "#country_value" )[0].value.trim();
          e.preventDefault();
          update_country(country_id,country,country_field_name,country["country"][country_field_name]);
        }
      }
      else {
        console.log("not input ignore...");
      }
    });
    $('.country_data').click(function() {
      if( $( "#country_value" )[0]  && $( this ).attr('id')==last_map_country_id) {
        console.log("Already input box do nothing..." + typeof $( "#country_value" )[0]);
      }
      else {
        var country_value = this.innerHTML;
        if(last_map_country_id!=null) {
          $( "#"+last_map_country_id ).html(last_map_country_value);
        }
        $( this ).html('<input type="text" id="country_value" value="'+country_value+'">');
        $( "#country_value" )[0].focus();
        last_map_country_value = country_value;
      }
      last_map_country_id=$( this ).attr('id');
    });
    $('.province_data').keypress(function(e) {
      if( $( "#province_value" )[0] ) {
        if(e.keyCode == 13) {
          var id_lbl_arr=$( this ).attr('id').split('_');;
          var province_id = id_lbl_arr[id_lbl_arr.length - 1];
          var province_field_name = id_lbl_arr[1];
          if(id_lbl_arr.length > 3) {
            province_field_name += "_" + id_lbl_arr[2];
          }
          var province = {};
          province["province"] = {};
          province["province"][province_field_name] = $( "#province_value" )[0].value.trim();
          e.preventDefault();
          update_province(province_id,province,province_field_name,province["province"][province_field_name]);
        }
      }
      else {
        console.log("not input ignore...");
      }
    });
    $('.province_data').click(function() {
      if( $( "#province_value" )[0]  && $( this ).attr('id')==last_map_province_id) {
        console.log("Already input box do nothing..." + typeof $( "#province_value" )[0]);
      }
      else {
        var province_value = this.innerHTML;
        if(last_map_province_id!=null) {
          $( "#"+last_map_province_id ).html(last_map_province_value);
        }
        $( this ).html('<input type="text" id="province_value" value="'+province_value+'">');
        $( "#province_value" )[0].focus();
        last_map_province_value = province_value;
      }
      last_map_province_id=$( this ).attr('id');
    });
    $('.province_submit').click(function(e) {
      e.preventDefault();
      var map=null;
      var country=null;
      var province={};
      province["province"] = {};
      map = JSON.parse($( this ).parent().children("input[id='map']")[0].value);
      country = JSON.parse($( this ).parent().children("input[id='country']")[0].value);
      $( this ).parent().children("div[class!='province_submit']").each(function( index, el ) {
        $( this ).children("input[id*='province_']").each(function( index2, el2 ) {
          if($( this ).val() != "") {
            province["province"][$( this ).attr('id').slice(9)] = $( this ).val();
          }
        });
      });
      if(Object.keys(province["province"]).length > 0) {
        payload={};
        payload["province"] = province["province"];
        payload["map"] = map;
        payload["country"] = country;
        add_province(payload,map["id"],province["province"]);
      }
    });
  }

window.onload = load_funcs;
