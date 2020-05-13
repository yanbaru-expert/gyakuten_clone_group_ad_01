document.addEventListener('turbolinks:load', () => {

  $('#image-form').ezdz({
      text: '画像',
      validators: {
          maxWidth:  2000,
          maxHeight: 2000
      },
      reject: function(file, errors) {
          if (errors.mimeType) {
              alert(file.name + ' must be an image.');
          }

          if (errors.maxWidth) {
              alert(file.name + ' must be width:2000px max.');
          }

          if (errors.maxHeight) {
              alert(file.name + ' must be height:2000px max.');
          }
      }
  });
  
})
