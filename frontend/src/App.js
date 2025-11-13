import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      setLoading(true);
      const response = await axios.get(process.env.REACT_APP_API_URL || 'http://localhost:5000');
      setMessage(response.data.message);
      setError('');
    } catch (err) {
      setError('Failed to connect to backend. Please check if the backend is running.');
      console.error('Error fetching data:', err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>MERN Stack Application</h1>
        {loading ? (
          <p>Loading...</p>
        ) : error ? (
          <div className="error">
            <p>{error}</p>
            <button onClick={fetchData}>Retry</button>
          </div>
        ) : (
          <p>{message}</p>
        )}
      </header>
    </div>
  );
}

export default App;
