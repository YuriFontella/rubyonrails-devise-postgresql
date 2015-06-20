class Empresa < ActiveRecord::Base
	validates_presence_of :nome, :descricao, :cidade
  has_many :produto
end