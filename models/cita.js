module.exports=function(sequelize, DataTypes){

return sequelize.define('cita', {


	idCita : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	fecha : {

		type : DataTypes.DATE,
		allowNull : false

	},

	hora : {

		type : DataTypes.STRING,
		allowNull : false
	},


	idVehiculo : {

		type : DataTypes.INTEGER,
		allowNull : false
	},

	idUsuario : {

		type : DataTypes.INTEGER,
		allowNull : false
	}


})



}