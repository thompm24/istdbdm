import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import { Link } from "react-router-dom"
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="text-bubble">
      <p style={{ fontSize:"1.5em" }}>
        <strong>What do you want to practice today?</strong>
      </p>
      <div>
        <Link to="/conjugations">Conjugations</Link>
        <Link to="/dna">Nouns</Link>
        <Link to="sva">Sentences</Link>
      </div>
    </div>
  )
}

export default App
