import { useEffect, useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0);
  const [title, setTitle] = useState('');

  useEffect(() => {
    const fetchTitleFromServer = async () => {
      const res = await fetch('http://localhost:3000/status');

      if (res.ok) {
        const data = await res.text();
        setTitle(data);
      }
    }
    fetchTitleFromServer();
  }, [])
  

  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          {title}
        </p>
      </div>
      <p className="read-the-docs">
        <img src='storage/cat.png' />
      </p>
    </>
  )
}

export default App
