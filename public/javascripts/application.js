$(function(){
  $('.fancybox').fancybox({
    padding: 20,
    scrolling: 'no',
    overlayOpacity: 0.3
  });

  $('tr.clickable').click(function(){
    window.location.href = $(this).data('href');
  });

  $('#scholar-search').autocomplete({
    source: function(request, response) {
      $.ajax({
        url: this.element.parents('form:first')[0].action,
        dataType: 'json',
        data: {
          term: request.term
        },
        success: function(data) {
          response($.map(data, function(item){
            return {
              label: item.last_name + ', ' + item.first_name,
              value: item.last_name + ', ' + item.first_name,
              id: item.id
            }
          }));
        }
      });
    },
    minLength: 1,
    select: function(event, ui) {
      var url = $(this).data('scholar-path') + '/' + ui.item.id;
      window.location.href = url;
    }
  });

  addNavCurrentClasses();
});

function addNavCurrentClasses() {
  var lastItem;
  $.each($('#public_nav li a, #admin_nav li a'), function(i, item){
    if(document.location.pathname.indexOf(item.getAttribute('href')) !== -1) {
      lastItem = item;
    }
  });
  lastItem.className += 'active';
}

function paginateSnapshots() {
  var snapshots = $('#snapshots').find('.snapshot');
  var submitButton = document.createElement('input');
    submitButton.type = 'submit';
    submitButton.value = 'Submit Profile';
    submitButton.style.width = '100%';

  for(var i = 0; i < snapshots.length; i++) {
    if(i !== 0) {
      // add a previous button
      var button = document.createElement('input');
      button.type = 'button';
      button.value = '\xAB Prev';
      button.className += 'button left';
      button.onclick = function() {
        var snapshot = $(this.parentNode);
        snapshot.fadeOut('fast', function(){
          snapshot.prev().fadeIn('fast');
        })
      }
      snapshots[i].appendChild(button);
    }

    if(i !== snapshots.length-1) {
      // add a next button
      var button = document.createElement('input');
      button.type = 'button';
      button.value = 'Next \xBB';
      button.className += 'button right';
      button.onclick = function() {
        var snapshot = $(this.parentNode);
        if(validateSection(snapshot)) {
          snapshot.fadeOut('fast', function(){
            snapshot.next().fadeIn('fast');
          });
        }
      }
      snapshots[i].appendChild(button);
    }

    var div = document.createElement('div');
    div.className = 'clear';
    snapshots[i].appendChild(div);
  }

  snapshots[snapshots.length-1].appendChild(submitButton);
  snapshots[0].style.display = 'block';
}

function validateSection(section) {
  var formItems = section.find('textarea, select');
  var errors = false;

  for(var i = 0; i < formItems.length; i++) {
    var currentItem = formItems[i];

    if(currentItem.type === 'textarea') {
      if(currentItem.value === null || currentItem.value === '') {
        errors = true;
        if(!currentItem.getAttribute('data-error')) {
          var startBackground = currentItem.style.background;
          var startBorder = currentItem.style.border;
          currentItem.style.background = '#ffeeee';
          currentItem.style.border = '1px solid #a00';
          currentItem.setAttribute('data-error', true);
          currentItem.onkeypress = function() {
            this.style.background = startBackground;
            this.style.border = startBorder;
            this.setAttribute('data-error', false);
          }
        }
      }
    } else if(currentItem.type === 'select-one') {
      if(currentItem.value === null || currentItem.value == 0) {
        errors = true;
        if(!currentItem.getAttribute('data-error')) {
          var startColor = currentItem.style.color;
          var startBorder = currentItem.style.border;
          currentItem.style.color = '#a00';
          currentItem.style.border = '1px solid #a00';
          currentItem.setAttribute('data-error', true);
          currentItem.onchange = function() {
            this.style.color = startColor;
            this.style.border = startBorder;
            this.setAttribute('data-error', false);
          }
        }
      }
    }
  }

  if(errors === true) {
    alert('You have incomplete fields. Please fill in the fields marked in red to continue.');
  }
  return (errors === false);
}