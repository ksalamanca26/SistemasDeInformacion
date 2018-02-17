module.exports=function(sequelize, DataTypes){

return sequelize.define('usuario', {


	idUsuario : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	nombre : {

		type : DataTypes.STRING,
		allowNull : false

	},

	apellido : {

		type : DataTypes.STRING,
		allowNull : false
	},


	email : {

		type : DataTypes.STRING,
		unique : true,
		allowNull : false
	},

	contraseña : {

		type : DataTypes.STRING,
		allowNull : false
	}


})



}