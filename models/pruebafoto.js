module.exports=function(sequelize, DataTypes){

return sequelize.define('pruebafoto', {


	ID : {

		type : DataTypes.INTEGER,
		primaryKey : true,
		autoIncrement : true,
		allowNull : false

	},

	foto : {
		type : DataTypes.BLOB,
		allowNull : true
	}

})



}