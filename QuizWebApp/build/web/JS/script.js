let preveiwContainer = document.querySelector('.products-preview');
let previewBox = preveiwContainer.querySelectorAll('.preview');
let modulePreveiwContainer = document.querySelector('.add-module-preview');
let addPreviewBox = modulePreveiwContainer.querySelector('.preview');
let deleteBtn = document.querySelector('.delete');

document.querySelector('.add-module').addEventListener('click', () => {
    modulePreveiwContainer.style.display = 'flex';
    addPreviewBox.classList.add('active');
  });

addPreviewBox.querySelector('.add-module-close').onclick = () =>{
    addPreviewBox.classList.remove('active');
    modulePreveiwContainer.style.display = 'none';
  };

document.querySelectorAll('.products-container .product').forEach(product =>{
  product.onclick = () =>{
    preveiwContainer.style.display = 'flex';
    let name = product.getAttribute('data-name');
    previewBox.forEach(preview =>{
      let target = preview.getAttribute('data-target');
      if(name == target){
        preview.classList.add('active');
      }
    });
  };
});

previewBox.forEach(close =>{
  close.querySelector('.fa-times').onclick = () =>{
    close.classList.remove('active');
    preveiwContainer.style.display = 'none';
  };
});