import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import App from './App';
import ConjugationList from './components/ConjugationList'; // This will be our new component
import DNA from './components/DNA'; // This will be our new component
import SVA from './components/SVA'; // This will be our new component
import image from './img/lpp01cf45.png'
import './index.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Router >
      <Routes>
        <Route path="/" element={<App />} style={{ backgroundImage:`url(${image})` }}/>
        <Route path="/conjugations" element={<ConjugationList />} /> {/* New route */}
        <Route path="/dna" element={<DNA />} /> {/* New route */}
        <Route path="/sva" element={<SVA />} /> {/* New route */}
      </Routes>
    </Router>
  </React.StrictMode>
);

