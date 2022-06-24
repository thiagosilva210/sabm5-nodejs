const mysql = require("mysql");

let connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

exports.view = (req, res) => {
  connection.query(
    "SELECT * FROM alimento ORDER BY nome LIMIT 8",
    (err, rows) => {
      if (!err) {
        res.render("home", { rows });
      } else {
        console.log(err);
      }

      console.log("The data from user table:", rows);
    }
  );
};

exports.find = (req, res) => {
  let searchTerm = req.body.search;

  // User the connection
  connection.query(
    "SELECT * FROM alimento WHERE nome LIKE ? OR categoria LIKE ?",
    ["%" + searchTerm + "%", "%" + searchTerm + "%"],
    (err, rows) => {
      if (!err) {
        res.render("buscar", { rows });
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};

exports.find2 = (req, res) => {
  let searchTerm = req.params.search;

  // User the connection
  connection.query(
    "SELECT * FROM alimento WHERE nome LIKE ? OR categoria LIKE ?",
    ["%" + searchTerm + "%", "%" + searchTerm + "%"],
    (err, rows) => {
      if (!err) {
        res.render("buscar", { rows });
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};

exports.find1 = (req, res) => {
  let searchTerm = req.body.search;

  // User the connection
  connection.query(
    "SELECT * FROM alimento WHERE nome LIKE ? OR categoria LIKE ?",
    ["%" + searchTerm + "%", "%" + searchTerm + "%"],
    (err, rows) => {
      if (!err) {
        res.render("pesquisar", { rows });
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};

exports.exclusive = (req, res) => {
  const searchTerm = req.params.id;

  connection.query(
    "SELECT * FROM alimento WHERE id LIKE ?",
    //["%" + searchTerm + "%", "%" + searchTerm + "%"],
    [searchTerm],
    (err, rows) => {
      if (!err) {
        res.render("exclusivo", { rows });
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};

exports.form = (req, res) => {
  res.render("addAlimento");
};

exports.create = (req, res) => {
  const { nome, categoria, imagem, descricao, fontes } = req.body;
  let searchTerm = req.body.search;

  let PhotoImagem;
  let outraVariavel;
  let uploadPath;

  PhotoImagem = req.files.imagem;
  uploadPath = "/home/raffl/Desktop/sabm5/public/images/" + PhotoImagem.name;

  PhotoImagem.mv(uploadPath, function (err) {
    if (err) return res.status(500).send(err);
  });
  outraVariavel = `/images/${PhotoImagem.name}`;

  // User the connection
  connection.query(
    "INSERT INTO alimento SET nome = ?, categoria = ?, imagem = ?, descricao = ?, fontes = ?",
    [nome, categoria, outraVariavel, descricao, fontes],
    (err, rows) => {
      if (!err) {
        res.render("addAlimento", {
          alert: "alimento cadastrado com sucesso.",
        });
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};

exports.edit = (req, res) => {
  const searchTerm = req.params.alimentoId;
  connection.query(
    "SELECT * FROM alimento WHERE id LIKE ?",
    //["%" + searchTerm + "%", "%" + searchTerm + "%"],
    [searchTerm],
    (err, rows) => {
      if (!err) {
        res.render("editAlimento", { rows });
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};

exports.update = (req, res) => {
  const { nome, categoria, imagem, descricao, fontes } = req.body;

  let sampleFile;
  let outraVariavel;
  let uploadPath;

  if (req.files) {
    sampleFile = req.files.sampleFile;
    uploadPath = "/home/raffl/Desktop/sabm5/public/images/" + sampleFile.name;

    sampleFile.mv(uploadPath, function (err) {
      if (err) return res.status(500).send(err);
    });
    outraVariavel = `/images/${sampleFile.name}`;
  } else {
    outraVariavel = req.body.imagem;
  }

  connection.query(
    "UPDATE alimento SET nome = ?, categoria = ?, imagem = ?, descricao = ?, fontes = ? WHERE id = ? ",
    [nome, categoria, outraVariavel, descricao, fontes, req.params.id],
    (err, rows) => {
      if (!err) {
        connection.query(
          "SELECT * FROM alimento WHERE id = ? ",
          [req.params.id],
          (err, rows) => {
            if (!err) {
              res.render("editAlimento", {
                rows,
                alert: `${nome} editado(a) com sucesso.`,
              });
            } else {
              console.log(err);
            }
            console.log("The data from user table: \n", rows);
          }
        );
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};

exports.delete = (req, res) => {
  connection.query(
    "DELETE FROM alimento WHERE id = ?",
    [req.params.id],
    (err, rows) => {
      if (!err) {
        res.redirect("/pesquisar");
      } else {
        console.log(err);
      }
      console.log("The data from user table: \n", rows);
    }
  );
};
