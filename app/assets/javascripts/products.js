$(function() {
  function buildHTML(todo) {
    var html = $('<li class="todo">').append(todo.content);
    return html;
  }  
  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var todo = textField.val();
    $.ajax({
      type: 'POST',
      url: '/todos.json',
      data: {
        todo: {
          content: todo
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = $('<li class="todo">').append(todo.content);
      $('.todos').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});

