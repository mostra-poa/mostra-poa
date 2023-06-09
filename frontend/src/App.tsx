import { useEffect } from "react";
import { BrowserRouter, Link, Routes, Route } from "react-router-dom";
import BlogPage from "./blog/BlogPage";
import SessionPage from "./session/SessionPage";
import HomePage from "./home/HomePage";
import TimelinePage from "./timeline/TimelinePage";

import '@fontsource/roboto/300.css';
import '@fontsource/roboto/400.css';
import '@fontsource/roboto/500.css';
import '@fontsource/roboto/700.css';

const style = { display: "flex", gap: "8px", };

function App() {
  useEffect(() => {
    if (window.location.pathname === "/") {
      window.location.replace("/app");
    }
  }, []);

  return (
    <BrowserRouter basename="app">
      <nav style={style}>
        <Link to="/">Home</Link>
        <Link to="/blog">Blog</Link>
        <Link to="/session">Programação</Link>
        <Link to="/timeline">Cronograma</Link>
      </nav>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="blog" element={<BlogPage />} />
        <Route path="session" element={<SessionPage />} />
        <Route path="timeline" element={<TimelinePage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
