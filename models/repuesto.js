module.exports=function(sequelize, DataTypes){

return sequelize.define('repuesto', {


	idRepuesto : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	Nombre : {

		type : DataTypes.STRING,
		allowNull : false

	},

	Serial : {

		type : DataTypes.STRING,
		allowNull : false
	},


	Cantidad : {

		type : DataTypes.INTEGER,
		allowNull : false
	},

	Tipo : {

		type : DataTypes.STRING,
		allowNull : false
	}


})



}