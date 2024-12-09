import React, { useState, useEffect } from 'react';
import App from '../App';
import { Link } from 'react-router-dom';
import "../index.css"

const ConjugationList = () => {
  const [verb, setVerb] = useState([]);
  const [tense, setTense] = useState([]);
  const [conjugation, setConjugation] = useState([]);
  const [userInput, setUserInput] = useState(Array(6).fill(''));
  const subjects = ["je", "tu", "il/elle/on", "nous", "vous", "ils/elles"];
  const [result, setResult] = useState("");
  const [score, setScore] = useState(0);
  const [highScore, setHighScore] = useState(0);
  const [scoreColor, setScoreColor] = useState("white");

  const fetchVerb = async () => {
    try {
      const response = await fetch('http://127.0.0.1:8000/conjugations/');
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const data = await response.json();
      setVerb(data.inf); 
      setTense(data.tense);
      setConjugation(data.conj);
      console.log(data);
    } catch (error) {
      console.error("Error fetching the verb:", error);
    }
  };


  useEffect(() => {
    fetchVerb();
  }, []);

  const handleChange = (index, value) => {
    const newUserInput = [...userInput];
    newUserInput[index] = value;
    setUserInput(newUserInput);
  }

  
  const handleSubmit = (event) => {
    event.preventDefault();
    if (JSON.stringify(userInput) == JSON.stringify(conjugation)) {
      fetchVerb();
      setUserInput(Array(6).fill(''))
      setScore(score + 1);
      if (score >= highScore) {
        setHighScore(score + 1);
        setScoreColor("#32a852");
      }
    }
    else {
      setResult(conjugation);
      setScore(0);
      setScoreColor("red");
      setTimeout(() => {
        setResult(Array(6).fill(""));
        setScoreColor("white");
      }, 2000 )
    }
  }

  return (
    <div>
      <div className="top-left">
        <Link to="/">I want to practice something else</Link>
        <p style={{ fontSize: "1.5em", color: scoreColor}}>Score:       {score}</p>
        <p style={{ color: scoreColor }}>High Score:  {highScore}</p>
      </div>
      <div style={{ maxWidth: '500px', margin: '0 auto' }}>
        <div className="text-bubble" style={{padding: "15px"}}>
          <p style={{fontSize:"2.5em"}}>Can you conjugate the verb &apos;{verb[1]}&apos; in the {tense[1]}</p>
        </div>
          <form onSubmit={handleSubmit}>
        <div className="container">
          {conjugation.map((item, index) => (
            <div className="row" key={index}>
              <span className="subject" style={{ color:"white" }}><strong>{subjects[index]} - </strong></span>
                <input  type="text" className="input" style={{ color:"white", background:"#0c1f45" }} value={userInput[index]} onChange={(e) => handleChange(index, e.target.value)}></input>
              <p className="correct" style={{ color: "red", margin: "0px", marginLeft: "10px" }}><strong>{result[index]}</strong></p>
            </div>
          ))}
        </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>
  );
};

export default ConjugationList;

