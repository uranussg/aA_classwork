
import React from 'react';
import ReactDom from 'react-dom';
import Clock from './clock'

document.addEventListener("DOMContentLoaded", () => {
  // debugger;
  const root = document.getElementById('root');
  ReactDom.render(<Clock/>, root)
});