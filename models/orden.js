module.exports=function(sequelize, DataTypes){

return sequelize.define('orden', {


	idOrden : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	Herramientas : {

		type : DataTypes.STRING,
		allowNull : false

	},

	Accesorios : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Llaves : {

		type : DataTypes.STRING,
		allowNull : false
	},

	Desperfectos : {

		type : DataTypes.STRING,
		allowNull : false

	},

	Gato : {
		type :DataTypes.STRING,
		allowNull : false
	},

	Caucho : {
		type : DataTypes.STRING,
		allowNull : false
	},

	Estado : {
		type : DataTypes.STRING,
		allowNull : false
	},

	Foto : {
		type : DataTypes.STRING,
		allowNull : true
	},

	idUsuario : {
		type : DataTypes.INTEGER,
		allowNull : false
	},

	Vehiculo : {
		type : DataTypes.INTEGER,
		allowNull : false
	},

	idCita : {
		type : DataTypes.INTEGER,
		allowNull : false
	}


})



}