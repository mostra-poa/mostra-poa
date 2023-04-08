import { useEffect } from "react";
import { BrowserRouter, Link, Routes, Route } from "react-router-dom";
import AdminPage from "./AdminPage";

const style = { display: "flex", gap: "8px", padding: "8px" };

function App() {
  /**
   * During development we can still access the base path at `/`
   * And this hook will make sure that we land on the base `/app`
   * path which will mount our App as usual.
   * In production, Phoenix makes sure that the `/app` route is
   * always mounted within the first request.
   * */
  useEffect(() => {
    if (window.location.pathname === "/") {
      window.location.replace("/app");
    }
  }, []);

  return (
    <BrowserRouter basename="app">
      <nav style={style}>
        <Link to="/">Home</Link>
        <Link to="/blog">blog Page</Link>
        <br />
      </nav>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="admin" element={<AdminPage />} />
        <Route path="blog" element={<BlogPage />} />
      </Routes>
    </BrowserRouter>
  );
}

function BlogPage() {
  return (
    <div>
      <h1>Blog Page</h1>
    </div>
  );
}

function HomePage() {
  return (
    <div>
      <h1>Home Page</h1>
    </div>
  );
}

export default App;
