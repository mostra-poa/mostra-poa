import { BrowserRouter, Link, Routes, Route} from "react-router-dom";
import AdminLoginPage from "./admin/AdminLoginPage";
import AdminBlogPage from "./admin/blog/AdminBlogPage";
import AdminSessionPage from "./admin/session/AdminSessionPage";


const style = { display: "flex", gap: "8px", };

function Admin() {
  return (
    <BrowserRouter basename="/admin">
      <nav style={style}>
        <Link to="/">Home</Link>
        <Link to="/blog">Blog</Link>
        <Link to="/session"> Programação</Link>
      </nav>
      <Routes>
        <Route path="/" element={<AdminLoginPage />} />
        <Route path="blog" element={<AdminBlogPage />} />
        <Route path="session" element={<AdminSessionPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default Admin;
