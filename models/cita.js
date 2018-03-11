module.exports=function(sequelize, DataTypes){

return sequelize.define('cita', {


	idCita : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	fechaAsignada : {
		type : DataTypes.DATE,
		allowNull : true
	},

	Hora : {

		type : DataTypes.STRING,
		allowNull : true
	},

	Estado : {
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