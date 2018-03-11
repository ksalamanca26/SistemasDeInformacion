module.exports=function(sequelize, DataTypes){

return sequelize.define('usuario', {


	idUsuario : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	Nombre : {

		type : DataTypes.STRING,
		allowNull : false

	},

	Apellido : {

		type : DataTypes.STRING,
		allowNull : false
	},


	Email : {

		type : DataTypes.STRING,
		unique : true,
		allowNull : false
	},

	Contraseña : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Rol : {

		type : DataTypes.INTEGER,
		allowNull : false

	}


})



}