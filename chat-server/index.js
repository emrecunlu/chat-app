const express = require('express');
const dotenv = require('dotenv');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const apiRoutes = require('./routes');
const http = require("http");
const { Server } = require('socket.io');
const errorHandler = require('./middlewares/ErrorHandler');
const cors = require('cors');
const fileUpload = require('express-fileupload');
const path = require('path');

dotenv.config();

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
    cors: {
        origin: "*",
        credentials: true
    }
});
const port = process.env.PORT

app.use(cors());

app.use('/images', express.static(path.join(__dirname, 'images')))
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(fileUpload())
app.use(morgan('dev'));

app.use('/api', apiRoutes);
app.use(errorHandler);


io.on("connection", (socket) => {
    console.log('user connected');

    socket.on('join-group', (groupId) => {
        console.log(`${socket.id} kullanıcı ${groupId} id'li gruba katıldı!`);
        socket.join(groupId);
    });

    socket.on('leave-group', groupId => {
        console.log(`${socket.id} kullanıcı ${groupId} id'li grubtan çıktı!`);
        socket.leave(groupId);
    })

    socket.on('group-message', (data) => {
        io.to(data.groupId).emit("group-message", data);
    })
})

server.listen(port, () => {
    console.log(`server listening on ${port} port.`);
});

