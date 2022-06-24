const express = require("express");
const exphbs = require("express-handlebars"); 
const fileUpload = require("express-fileupload");

const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;

let session = require("express-session");
let MySQLStore = require("express-mysql-session")(session);

const bodyParser = require("body-parser");
const mysql = require("mysql");


const app = express();
const flash = require('express-flash')



app.use(
  session({
    key: "session_cookie_name",
    secret: "session_cookie_secret",
    store: new MySQLStore({
      host: "localhost",
      port: 3306,
      user: process.env.DB_USER,
    
      password: process.env.DB_PASS,
      database: "SABM5",
    }),
    resave: false,
    saveUninitialized: false,
    cookie: {
      maxAge: 1000 * 60 * 60 * 24,
    },
  })
);

require("dotenv").config();

const port = process.env.PORT || 5000;
app.use(bodyParser.json());

app.use(passport.initialize());
app.use(passport.session());

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use(flash())

// Static Files
app.use(express.static("public"));
app.use(fileUpload());

const handlebars = exphbs.create({ extname: ".hbs" });
app.engine(".hbs", handlebars.engine);
app.set("view engine", ".hbs");

app.use((req, res, next) => {
  
  next();
});

let connection = mysql.createConnection({
  host: "localhost",
  user: process.env.DB_USER,
  database: "SABM5",  
  password: process.env.DB_PASS,
  multipleStatements: true,
});
connection.connect((err) => {
  if (!err) {
    console.log("Connected");
  } else {
    console.log("Conection Failed");
  }
});

const customFields = {
  usernameField: "uname",
  passwordField: "pw",
};

/*Passport JS*/
const verifyCallback = (email, password, done) => {

  connection.query(
    "SELECT * FROM administrador WHERE email = ? ",
    [email],
    function (error, results, fields) {
      console.log(results, "resultas");
      if (error) return done(error);
      if (results.length == 0) {
        return done(null, false, {message: "Usuário ou senha incorretos"});
      }

      user = {
        id: results[0].id,
        email: results[0].email,
        password: results[0].password,
      };

      if (password === user.password) {
        return done(null, user);
      } else {
        return done(null, false, {message: "Usuário ou senha incorretos"});
      }
    }
  );
};


const strategy = new LocalStrategy(customFields, verifyCallback);
passport.use(strategy);

passport.serializeUser((user, done) => {
  console.log("inside serialize");
  done(null, user.id);
});

passport.deserializeUser(function (userId, done) {
  console.log("deserializeUser" + userId);
  connection.query(
    "SELECT * FROM administrador WHERE id = ?",
    [userId],
    function (error, results) {
      done(null, results[0]);
    }
  );
});


const routes = require("./server/routes/rotaAlimento");
app.use("/", routes);

app.listen(port, () => console.log(`Listening on port ${port}`));