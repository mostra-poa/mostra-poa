import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';

function createData(
  activity: string,
  date_or_deadline: string
) {
  return { activity, date_or_deadline };
}

const rows = [
  createData('Realização da 12ª Mostra de Ensino, Extensão e Pesquisa', '24 e 25 de outubro de 2023'),
];

export default function TimelinePage() {
  return (
    <TableContainer component={Paper}>
      <h1>Cronograma</h1>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Atividade</TableCell>
            <TableCell align="right">Datas (prazos)</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <TableRow
              key={row.activity}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {row.activity}
              </TableCell>
              <TableCell align="right">{row.date_or_deadline}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}
