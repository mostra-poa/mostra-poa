import React, { useState, useEffect } from 'react';
import axios from 'axios';


type Session ={
    id: number;
    name: string;
    location: string;
    startDate: string;
    endDate: string;
}
export default function DayList() {
    const [sessions, setSessions] = useState<Session[]>([]);

    useEffect(() => {
        axios.get<{ data: Session[] }>('/api/sessions')
        .then(response => setSessions(response.data.data))
        .catch(error => console.error(error));
    }, []);
    
        return (
            <div>
                {sessions.length === 0 ? (
                    <p>Sem eventos para mostrar.</p>
                ) : ( 
                    <ul>
                        {sessions.map(session => (
                        <li key={session.id}>
                            <h2>{session.name}</h2>
                            <p>{session.location}</p>
                            <p>{session.startDate}</p>
                            <p>{session.endDate}</p>   
                        </li> 
                        ))}
                    </ul>
                )}
                </div>
        )
}
