import React, { useState, useEffect } from "react";
import { Link }from "react-router-dom";
import "../index.css";

const TranslationGame = () => {
  const [englishSentence, setEnglishSentence] = useState("");
  const [frenchSentence, setFrenchSentence] = useState("");
  const [userInput, setUserInput] = useState("");
  const [error, setError] = useState(null);
  const [score, setScore] = useState(0);
  const [highScore, setHighScore] = useState(0);
  const [scoreColor, setScoreColor] = useState("white");

  const fetchSentences = async () => {
    try {
      const response = await fetch("http://127.0.0.1:8000/sva");
      if (!response.ok) {
        throw new Error("Failed to fetch sentences");
      }
      const data = await response.json();
      console.log(data);
      const { en, fr } = data;
      console.log(en);

      setEnglishSentence(en);
      setFrenchSentence(fr);
      setUserInput("");
      setError(null);
    } catch (err) {
      console.error(err);
      setError("Failed to fetch sentences. Please try again later.");
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    if (userInput.trim().toLowerCase() === frenchSentence.toLowerCase()) {
      setScore(score + 1);
      if (score >= highScore) {
        setHighScore(score + 1);
        setScoreColor("#32a852");
      }
      fetchSentences(); 
    } else {
      setScore(0);
      setScoreColor("red");
      setError(frenchSentence);
      setTimeout(() => {
        setError(""); 
        setScoreColor("white");
      }, 2000);
    }
  };

  useEffect(() => {
    fetchSentences();
  }, []);

  return (
    <div>
      <div className="top-left">
        <Link to="/">I want to practice something else</Link>
        <p style={{ fontSize: "1.5em", color: scoreColor }}>
          Score:      {score} 
        </p>
        <p style={{ color: scoreColor }}>
          High Score: {highScore}
        </p>
      </div>
      <div style={{ textAlign: "center", padding: "20px" }}>
        {englishSentence ? (
          <div>
            <p className="text-bubble" style={{ fontSize: "2.5em", margin: "1em" }}>
              {englishSentence}
            </p>

            <p style={{ color: "white", fontSize: "1.5em" }}>
              <strong>Qu&apos;est-ce que ça veux dire?</strong>
            </p>

            <form onSubmit={handleSubmit}>
              <input
                type="text"
                className="input"
                style={{ fontSize: "1.5em", minWidth: "400px", color: "white", background: "#0c1f45" }}
                value={userInput}
                onChange={(e) => setUserInput(e.target.value)}
                placeholder="Enter your translation"
              />
              <button type="submit" style={{ marginLeft: "10px", padding: "10px 20px" }}>
                Submit
              </button>
            </form>
            <p style={{ color:"white" }}>
              Current Score: <strong>{score}</strong>
            </p>
          </div>
        ) : (
          <p>Loading...</p>
        )}
        {error && <p style={{ fontSize: "1.25em", color: "red" }}><strong>{error}</strong></p>}
      </div>
    </div>
  );
};

export default TranslationGame;

