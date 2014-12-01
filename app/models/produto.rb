class Produto < ActiveRecord::Base
	validates_presence_of :nome, :descricao, :preco
end