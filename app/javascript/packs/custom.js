openMenu = (e) =>{
  menuArrow.classList.toggle("closed");
  dropDown.classList.toggle('closed')
}

document.onclick = (e) =>{
  if (e.target.id !== 'dropDown') openMenu();
}