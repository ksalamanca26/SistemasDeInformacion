module.exports=function(sequelize, DataTypes){

return sequelize.define('vehiculo', {


	idVehiculo : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	Serial : {

		type : DataTypes.STRING,
		allowNull : false

	},

	fechaRegistro : {

		type : DataTypes.DATE,
		allowNull : false
	},


	Placa : {

		type : DataTypes.STRING,
		unique : true,
		allowNull : false
	},

	Año : {

		type : DataTypes.STRING,
		allowNull : false
	},

	idModelo : {

		type : DataTypes.INTEGER,
		allowNull : false
	},

	idUsuario : {

		type : DataTypes.INTEGER,
		allowNull : false
	}


})



}