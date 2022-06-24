const express = require("express");
const router = express.Router();
const alimentoController = require("../controllers/alimentoController");
const passport = require("passport");

/*middleware*/

function isAuth(req, res, next) {
  if (req.isAuthenticated()) {
    next();
  } else {
    res.redirect("/notAuthorized");
  }
}

function isAuth2(req, res, next) {
  if (req.isAuthenticated()) {
    res.redirect("/admin");
  } else {
    next();
  }
}

router.get("/addAlimento", isAuth, alimentoController.form);
router.post("/addAlimento", alimentoController.create);
router.get("/", alimentoController.view);

router.get("/buscar", function (req, res) {
  res.render("buscar");
});

router.get("/buscar/:search", alimentoController.find2);
router.post("/buscar", alimentoController.find);

router.get("/exclusivo/:id", alimentoController.exclusive);

router.get("/editAlimento/:alimentoId", isAuth, alimentoController.edit);
router.post("/editAlimento/:id", alimentoController.update);

router.get("/pesquisar", isAuth, function (req, res) {
  res.render("pesquisar");
});

router.post("/pesquisar", alimentoController.find1);

router.get("/excluir/:id", alimentoController.delete);

////////////////////   LOGIN       /////////////////////

router.get("/login", isAuth2, (req, res, next) => {
  res.render("login");
});

router.get("/logout", (req, res, next) => {
  req.logout();
  res.redirect("/protected-route");
});

router.get("/admin", isAuth, function (req, res) {
  res.render("admin");
});

router.get("/login-success", isAuth, (req, res, next) => {
  res.send(
    '<p>You successfully logged in. --> <a href="/protected-route">Go to protected route</a></p>'
  );
});

router.get("/login-failure", (req, res, next) => {
  res.send("You entered the wrong password.");
});

router.get("/protected-route", isAuth, (req, res, next) => {
  res.send(
    '<h1>You are authenticated</h1><p><a href="/logout">Logout and reload</a></p>'
  );
});

router.get("/notAuthorized", (req, res, next) => {
  console.log("Inside get");
  res.send(
    '<h1>Você não está autorizado a acessar esta área!</h1><p><a href="/login">Fazer Login</a></p>'
  );
});

router.post(
  "/login",
  passport.authenticate("local", {
    successRedirect: "/admin",
    failureRedirect: "/login",
    failureFlash: true,
  })
);

///////////////////////////////////////////////

module.exports = router;
