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
		allowNull : true

	},

	Diagnostico : {

		type : DataTypes.STRING,
		allowNull : true
	},


	Accesorios : {

		type : DataTypes.STRING,
		allowNull : true
	},

	Llaves : {

		type : DataTypes.STRING,
		allowNull : true
	},

	Desperfectos : {

		type : DataTypes.STRING,
		allowNull : true

	},

	Gato : {
		type :DataTypes.STRING,
		allowNull : true
	},

	Caucho : {
		type : DataTypes.STRING,
		allowNull : true
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
	}


})



}