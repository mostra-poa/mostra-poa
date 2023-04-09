import React, { useState, useEffect } from 'react';
import axios from 'axios';

type BlogPost = {
  id: number;
  title: string;
  body: string;
};

export default function PostList() {
  const [posts, setPosts] = useState<BlogPost[]>([]);

  useEffect(() => {
    axios.get<{ data: BlogPost[] }>('/api/posts')
      .then(response => setPosts(response.data.data))
      .catch(error => console.error(error));
  }, []);
  
  return (
    <div>
      {posts.length === 0 ? (
        <p>Sem posts para mostrar.</p>
      ) : (
        <ul>
          {posts.map(post => (
            <li key={post.id}>
              <h2>{post.title}</h2>
              <p>{post.body}</p>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

